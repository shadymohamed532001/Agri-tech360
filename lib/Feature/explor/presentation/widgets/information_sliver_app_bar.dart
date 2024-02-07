import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';

class InformationSliverAppBar extends StatelessWidget {
  const InformationSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      backgroundColor: ColorManger.whiteColor,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          ImagesAssetsManger.cameraImage,
          fit: BoxFit.contain,
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          decoration: BoxDecoration(
            color: ColorManger.whiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Container(
            height: 4.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: ColorManger.greyColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
