import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ExplorViewBody extends StatefulWidget {
  const ExplorViewBody({super.key});

  @override
  State<ExplorViewBody> createState() => _ExplorViewBodyState();
}

class _ExplorViewBodyState extends State<ExplorViewBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Explor View',
        style: AppStyle.font14Blacksemibold,
      ),
    );
  }
}
