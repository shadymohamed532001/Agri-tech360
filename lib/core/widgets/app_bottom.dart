import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    required this.bottomtext,
  });

  final void Function() onPressed;
  final Color? backgroundColor;
  final String bottomtext;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20),
        backgroundColor: backgroundColor,
        shape: StadiumBorder(
          side: BorderSide(
            color: ColorManger.primaryColor,
          ),
        ),
      ),
      child: Text(bottomtext,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: ColorManger.whiteColor)),
    );
  }
}
