import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const Spacer(),
            Container(
              width: 120.w,
              height: double.infinity,
              color: ColorManger.lightpinkColor,
            ),
          ],
        ),
        Positioned(
          top: 300,
          left: 110,
          child: FadeInRight(
            duration: const Duration(milliseconds: 600),
            child: Image.asset(
              ImagesAssetsManger.floweImage,
              height: 345.h,
              width: 345.w,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Column(
              children: [
                Text(
                  'Precious App',
                  style: AppStyle.font20Primaryregular,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
