import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class RecntlyViewedItem extends StatelessWidget {
  const RecntlyViewedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: ColorManger.whiteColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -35,
                  left: -20,
                  child: Image.asset(
                    ImagesAssetsManger.flowe_2Image,
                    height: 130.h,
                    width: 100.w,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ageratum',
                    style: AppStyle.font14Blacksemibold,
                  ),
                  verticalSpacing(8),
                  Text(
                    'Contrary to popular belief not simply random It has root in a piece.',
                    style: AppStyle.font10Greyregular,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
