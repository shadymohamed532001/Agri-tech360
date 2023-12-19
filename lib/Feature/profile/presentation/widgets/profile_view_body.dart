import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile View',
        style: AppStyle.font14Blacksemibold,
      ),
    );
  }
}
