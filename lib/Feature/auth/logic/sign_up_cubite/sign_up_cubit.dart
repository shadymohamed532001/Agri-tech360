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
  }) {
    emit(SignUpLoading());
    signUpRepo
        .signUpUser(
      fullName: name,
      email: email,
      password: password,
      phoneNumber: phone,
      city: city,
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
