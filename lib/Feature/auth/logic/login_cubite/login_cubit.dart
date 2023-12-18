import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  final LoginRepo loginRepo;

  void userSignIn({
    required String email,
    required String password,
  }) {
    emit(LoginLoading());

    loginRepo
        .loginUser(
      email: email,
      password: password,
    )
        .then((value) {
      value.fold(
        (failure) {
          emit(LoginErorr(error: failure.errMessage.toString()));
        },
        (user) {
          //  LocalServices.saveData(key: token,value: );

          emit(LoginSucess(bagLoginModel: user));
        },
      );
    });
  }

  bool isPasswordShow = true;
  Widget icon = const Icon(Icons.visibility_off);
  void changepasswordVisiability() {
    isPasswordShow = !isPasswordShow;

    icon = isPasswordShow
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);

    emit(LoginChangePasswordVisiablity());
  }
}
