import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/auth/logic/login_cubite/login_cubit.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_text_formfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    var logincubite = context.read<LoginCubit>();
    return Form(
      key: logincubite.formKey,
      autovalidateMode: context.read<LoginCubit>().autovalidateMode,
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
            controller: logincubite.emailController,
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
            obscureText: logincubite.isPasswordShow,
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
            controller: logincubite.passwordController,
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
        ],
      ),
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
