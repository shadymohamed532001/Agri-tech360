import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class CustomDotItems extends StatelessWidget {
  const CustomDotItems({
    super.key,
    required this.currnetIndex,
  });

  final int currnetIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Container(
          height: 7.h,
          width: currnetIndex == index ? 30 : 10,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: currnetIndex == index
                ? ColorManger.primaryColor
                : ColorManger.darkGreyColor,
          ),
        ),
      ),
    );
  }
}
