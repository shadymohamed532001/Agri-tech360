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
  }) {
    emit(SignUpLoading());
    signUpRepo
        .signUpUser(
      name: name,
      email: email,
      password: password,
      phone: phone,
    )
        .then((value) {
      value.fold(
        (failure) {
          emit(SignUpError(errorMessage: failure.errMessage));
        },
        (user) {
          emit(SignUpSucess(bagRegisterModel: user));
        },
      );
    });
  }

  // BagAuthModel? bagAuthModel;

  // void registerUser({
  //   required String name,
  //   required String email,
  //   required String password,
  //   required String phone,
  //   String? lang,
  // }) async {
  //   emit(SignUpLoading());
  //   await ApiServices.postData(
  //     endpoint: registerendPoint,
  //     lang: lang ?? 'en',
  //     data: {
  //       'name': name,
  //       'email': email,
  //       'password': password,
  //       'phone': phone,
  //     },
  //   ).then((value) {
  //     bagAuthModel = BagAuthModel.fromJson(value.data);
  //     emit(SignUpSucess(bagRegisterModel: bagAuthModel!));
  //   }).catchError((error) {
  //     // print(error.toString());
  //     emit(SignUpError(errorMessage: error.toString()));
  //   });
  // }

  bool isPasswordShow = true;

  Widget icon = const Icon(Icons.visibility_off);
  void changepasswordVisiability() {
    isPasswordShow = !isPasswordShow;

    icon = isPasswordShow
        ? const Icon(Icons.visibility_off)
        : const Icon(Icons.visibility);

    emit(SignUpChangepasswordvisabilty());
  }
}
