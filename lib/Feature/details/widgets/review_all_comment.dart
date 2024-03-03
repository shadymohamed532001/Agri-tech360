import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ReviewAllComment extends StatelessWidget {
  const ReviewAllComment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Divider(thickness: 0.5, height: 5, color: ColorManger.greyColor),
          Padding(
            padding: EdgeInsets.only(
              top: 8.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '(${Random().nextInt(100)} Reviews)',
                  style: AppStyle.font16Blackmedium,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
