import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home View Coming soon  !!!!!!!',
          textAlign: TextAlign.center,
          style: AppStyle.font32BlackBold,
        ),
      ),
    );
  }
}
