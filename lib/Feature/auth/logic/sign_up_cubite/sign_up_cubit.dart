import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signUpRepo}) : super(SignUpInitial());

  final SignUpRepo signUpRepo;

  void signUpUser({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String city,
    required String profileImage,
  }) {
    emit(SignUpLoading());
    signUpRepo
        .signUpUser(
      fullName: name,
      email: email,
      password: password,
      phoneNumber: phone,
      city: city,
      profileImage: profileImage,
    )
        .then((value) {
      value.fold(
        (failure) {
          emit(SignUpError(errorMessage: failure.errMessage));
        },
        (user) {
          emit(SignUpSucess(registerModel: user));
        },
      );
    });
  }

  var formKey = GlobalKey<FormState>();

  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  bool isPasswordShow = true;

  void changepasswordVisiability() {
    isPasswordShow = !isPasswordShow;
    emit(SignUpChangepasswordvisabilty());
  }
}
