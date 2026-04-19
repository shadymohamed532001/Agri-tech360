import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/auth/logic/login_cubite/login_cubit.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/Feature/auth/presentation/widgets/login/widgets/donot_have_acound_and_sign_up.dart';
import 'package:smartsoil/Feature/auth/presentation/widgets/login/widgets/login_form.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/helper/local_services.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';
import 'package:smartsoil/core/widgets/shows_toust_color.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  bool _isLoadingDialogVisible = false;

  void _closeLoadingDialogIfNeeded(BuildContext context) {
    if (!_isLoadingDialogVisible) return;
    _isLoadingDialogVisible = false;
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          _isLoadingDialogVisible = true;
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(
                color: ColorManger.whiteColor,
              ),
            ),
          );
        }
        if (state is LoginSucess) {
          if (state.loginModel.status == true) {
            _closeLoadingDialogIfNeeded(context);
            showTouster(
              massage: state.loginModel.message!,
              state: ToustState.SUCCESS,
            );
            saveUserData(state.loginModel.data!);

            LocalServices.saveData(
              key: 'token',
              value: state.loginModel.data!.token,
            ).then(
              (value) {
                if (!context.mounted) return;
                context.navigateAndRemoveUntil(
                  newRoute: Routes.layOutViewsRoute,
                );
              },
            );
          }
        }
        if (state is LoginErorr) {
          _closeLoadingDialogIfNeeded(context);
          final prefix = state.failureType == FailureType.flutter
              ? '[App Error] '
              : '[Server Error] ';
          showTouster(
            massage: '$prefix${state.error}',
            state: ToustState.ERROR,
          );
        }
      },
      builder: (context, state) {
        var loginCubite = BlocProvider.of<LoginCubit>(context);
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                verticalSpacing(10),
                Text(
                  'SIGN IN',
                  style: AppStyle.font14Blacksemibold.copyWith(fontSize: 22),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                FadeInDown(
                  child: const LoginForm(),
                ),
                CustomBottom(
                  bottomtext: 'Sign in',
                  onPressed: () {
                    if (loginCubite.formKey.currentState!.validate() == true) {
                      loginUser(context);
                    } else {
                      loginCubite.autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  backgroundColor: ColorManger.primaryColor,
                ),
                const DonotHaveAcoundAndSignUp(),
              ],
            ),
          ),
        );
      },
    );
  }

  void loginUser(BuildContext context) {
    BlocProvider.of<LoginCubit>(context).userSignIn(
      email: context.read<LoginCubit>().emailController.text,
      password: context.read<LoginCubit>().passwordController.text,
    );
  }

  void saveUserData(Data data) {
    UserModel userModel = UserModel(data: data);
    String userJson = jsonEncode(userModel.toJson());
    LocalServices.saveData(key: 'userData', value: userJson);
  }
}
