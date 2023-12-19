import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class DetactViewBody extends StatefulWidget {
  const DetactViewBody({super.key});

  @override
  State<DetactViewBody> createState() => _DetactViewBodyState();
}

class _DetactViewBodyState extends State<DetactViewBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Detact View',
        style: AppStyle.font14Blacksemibold,
      ),
    );
  }
}
