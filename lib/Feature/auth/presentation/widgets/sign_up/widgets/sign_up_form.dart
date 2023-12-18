import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/auth/logic/sign_up_cubite/sign_up_cubit.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_text_formfield.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    var signupCubite = context.read<SignUpCubit>();
    return Form(
      key: signupCubite.formKey,
      autovalidateMode: signupCubite.autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.0.w),
            child: Text(
              'Full Name',
              style: AppStyle.font14lightblacksemibold,
            ),
          ),
          CustomTextFormFiled(
            obscureText: false,
            hintText: 'Name',
            keyboardType: TextInputType.text,
            controller: signupCubite.nameController,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Email',
                style: AppStyle.font14lightblacksemibold,
              )),
          CustomTextFormFiled(
            onChanged: (value) {
              validateEmail(value);
            },
            obscureText: false,
            hintText: 'Patient@self.com',
            keyboardType: TextInputType.emailAddress,
            controller: signupCubite.emailController,
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
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'Password',
              style: AppStyle.font14lightblacksemibold,
            ),
          ),
          CustomTextFormFiled(
            obscureText: BlocProvider.of<SignUpCubit>(context).isPasswordShow,
            suffixIcon: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                BlocProvider.of<SignUpCubit>(context)
                    .changepasswordVisiability();
              },
              child: BlocProvider.of<SignUpCubit>(context).icon,
            ),
            hintText: 'Min 8 Cyfr',
            keyboardType: TextInputType.visiblePassword,
            controller: signupCubite.passwordController,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return 'Please enter your password';
              }
              if (text.length < 8) {
                return 'Password 8 chars at least';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              'City',
              style: AppStyle.font14lightblacksemibold,
            ),
          ),
          CustomTextFormFiled(
            obscureText: false,
            hintText: 'City Name',
            keyboardType: TextInputType.phone,
            controller: signupCubite.phoneController,
            validator: (text) {
              if (text == null || text.trim().isEmpty) {
                return 'Please enter your City Name';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  void validateEmail(String val) {
    if (!EmailValidator.validate(val, true) && val.isNotEmpty) {
      setState(() {
        errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        errorMessage = "";
      });
    }
  }
}
