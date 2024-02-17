import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/auth/logic/sign_up_cubite/sign_up_cubit.dart';
import 'package:smartsoil/Feature/auth/presentation/widgets/sign_up/widgets/sign_up_form.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/networking/local_services.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';
import 'package:smartsoil/core/widgets/shows_toust_color.dart';

// ignore: must_be_immutable
class SignUpViewBody extends StatefulWidget {
  static const String routeName = 'register';
  bool isChecked = false;

  SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          // show the CircularProgressIndicator widget
          showDialog(
            context: context,
            builder: (_) => Center(
              child: CircularProgressIndicator(
                color: ColorManger.whiteColor,
              ),
            ),
          );
        } else if (state is SignUpSucess) {
          if (state.registerModel.status == true) {
            Navigator.of(context)
                .pop(); // close the dialog if successfully logged in
            showTouster(
              massage: state.registerModel.message!,
              state: ToustState.SUCCESS,
            );
            LocalServices.saveData(
              key: 'token',
              value: state.registerModel.data!.token,
            ).then(
              (value) {
                context.navigateAndRemoveUntil(
                  newRoute: Routes.layOutViewsRoute,
                );
              },
            );
          }
        } else if (state is SignUpError) {
          Navigator.of(context).pop(); // close the dialog if login fails
          showTouster(
            massage: state.errorMessage,
            state: ToustState.ERROR,
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  'SIGN UP',
                  style: AppStyle.font14Blacksemibold.copyWith(fontSize: 22),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                FadeInDown(
                  child: const SignUpForm(),
                ),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.36,
                      child: Checkbox(
                        value: widget.isChecked,
                        activeColor: ColorManger.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(
                              color: ColorManger.primaryColor,
                              style: BorderStyle.none,
                            )),
                        onChanged: (bool? newValue) {
                          setState(() {
                            widget.isChecked = newValue!;
                          });
                        },
                      ),
                    ),
                    Text(
                      'I agree with Terms and ',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      'Privacy Policy',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ColorManger.primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                CustomBottom(
                  bottomtext: 'Sign Up',
                  onPressed: () {
                    if (context
                            .read<SignUpCubit>()
                            .formKey
                            .currentState!
                            .validate() &&
                        widget.isChecked == true) {
                      registerUser(context);
                    } else {
                      context.read<SignUpCubit>().autovalidateMode =
                          AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  backgroundColor: ColorManger.primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account?',
                      style: AppStyle.font12Blackmedium,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign In',
                        style: AppStyle.font13PrimaryBold.copyWith(
                          color: ColorManger.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void registerUser(BuildContext context) {
    BlocProvider.of<SignUpCubit>(context).signUpUser(
        email: context.read<SignUpCubit>().emailController.text,
        password: context.read<SignUpCubit>().passwordController.text,
        name: context.read<SignUpCubit>().nameController.text,
        phone: context.read<SignUpCubit>().phoneController.text,
        city: context.read<SignUpCubit>().cityController.text,
        profileImage: 'null');
  }
}
