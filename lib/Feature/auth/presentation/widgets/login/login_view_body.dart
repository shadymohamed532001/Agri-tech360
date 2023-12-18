import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/auth/logic/login_cubite/login_cubit.dart';
import 'package:smartsoil/core/helper/extentaions.dart';
import 'package:smartsoil/core/networking/local_services.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';
import 'package:smartsoil/core/widgets/app_text_formfield.dart';
import 'package:smartsoil/core/widgets/shows_toust_color.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  String errorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          // show the CircularProgressIndicator widget
          showDialog(
            context: context,
            builder: (_) => Center(
              child: CircularProgressIndicator(
                color: ColorManger.whiteColor,
              ),
            ),
          );
        } else if (state is LoginSucess) {
          if (state.bagLoginModel.status == true) {
            Navigator.of(context)
                .pop(); // close the dialog if successfully logged in
            showTouster(
              massage: state.bagLoginModel.message!,
              state: ToustState.SUCCESS,
            );
            LocalServices.saveData(
              key: 'token',
              value: state.bagLoginModel.data!.token,
            ).then((value) {
              context.pushNamedAndRemoveUntil(
                Routes.homeViewRoute,
                routePredicate: (route) => false,
              );
            });
          } else {
            showTouster(
              massage: state.bagLoginModel.message!,
              state: ToustState.ERROR,
            );
            Navigator.of(context).pop(); // close the dialog if login fails
          }
        } else if (state is LoginErorr) {
          Navigator.of(context).pop(); // close the dialog if login fails
          showTouster(
            massage: state.error,
            state: ToustState.ERROR,
          );
        }
      },
      builder: (context, state) {
        var loginCubite = BlocProvider.of<LoginCubit>(context);
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  'SIGN IN',
                  style: AppStyle.font14Blacksemibold.copyWith(fontSize: 22),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16.0.w),
                        child: Text(
                          'Email',
                          style: AppStyle.font14lightblacksemibold,
                        ),
                      ),
                      CustomTextFormFiled(
                        onChanged: (value) {
                          validateEmail(value);
                        },
                        obscureText: false,
                        hintText: 'Patient@self.com',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26),
                        child: Text(
                          errorMessage,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorManger.redColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.003,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0.w),
                        child: Text(
                          'Password',
                          style: AppStyle.font14lightblacksemibold,
                        ),
                      ),
                      CustomTextFormFiled(
                        obscureText: loginCubite.isPasswordShow,
                        suffixIcon: InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            BlocProvider.of<LoginCubit>(context)
                                .changepasswordVisiability();
                          },
                          child: BlocProvider.of<LoginCubit>(context).icon,
                        ),
                        hintText: 'Min 6 Cyfr',
                        keyboardType: TextInputType.visiblePassword,
                        controller: passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter your password';
                          }
                          if (text.length < 6) {
                            return 'Password 8 chars at least';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.of(context)
                          // .pushNamed(ForgetPassword.routeName);
                        },
                        child: Text(
                          textAlign: TextAlign.right,
                          'Forgot your password?',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: ColorManger.primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                      CustomBottom(
                        bottomtext: 'Sign in',
                        onPressed: () {
                          if (formKey.currentState!.validate() == true) {
                            loginUser(context);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                        backgroundColor: ColorManger.primaryColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: AppStyle.font12Blackmedium,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Sign Up',
                              style: AppStyle.font13PrimaryBold.copyWith(
                                color: ColorManger.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void loginUser(BuildContext context) {
    BlocProvider.of<LoginCubit>(context).userSignIn(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  void validateEmail(String val) {
    if (!EmailValidator.validate(val, true) && val.isNotEmpty) {
      setState(() {
        errorMessage = "Please enter valid Email Address";
      });
    } else {
      setState(() {
        errorMessage = "";
      });
    }
  }
}
