import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class InformationSliverAppBar extends StatelessWidget {
  const InformationSliverAppBar({super.key, required this.plant});
  final PlantModle plant;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      backgroundColor: ColorManger.whiteColor.withOpacity(0.1),
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            child: Image.asset(
              'assets/images/Almonds2.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      iconTheme: IconThemeData(color: ColorManger.blackColor),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Container(
          height: 5,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            color: ColorManger.whiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Container(
            height: 5.h,
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
