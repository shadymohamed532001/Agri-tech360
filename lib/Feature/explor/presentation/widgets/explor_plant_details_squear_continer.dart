import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ExplorPlantDetailsSquearContiner extends StatelessWidget {
  const ExplorPlantDetailsSquearContiner({
    super.key,
    required this.explorPlantDetailsSquearText,
    required this.explorPlantDetailsSquearIcon,
  });
  final String explorPlantDetailsSquearText;
  final Icon explorPlantDetailsSquearIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122.w,
      height: 118.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(255, 28, 23, 23),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          explorPlantDetailsSquearIcon,
          verticalSpacing(16),
          Text(
            explorPlantDetailsSquearText,
            style: AppStyle.font14Blacksemibold,
          )
        ],
      ),
    );
  }
}
