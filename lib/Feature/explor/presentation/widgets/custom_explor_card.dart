import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/models/planr_model_class.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class CustomExplorCard extends StatelessWidget {
  const CustomExplorCard({super.key, required this.plant});

  final PlantModle plant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(
        routeName: Routes.plantDetailsViewRoute,
        arguments:
            PlantModelClass(plantModle: plant), // pass data to another screan
      ),
      child: Container(
        width: 250.w,
        height: 160.h,
        decoration: BoxDecoration(
          color: ColorManger.whiteColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, right: 9),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plant.name,
                        style: AppStyle.font14Blacksemibold,
                      ),
                      verticalSpacing(8),
                      Expanded(
                        child: Text(
                          plant.mediumDescription,
                          style: AppStyle.font10Greyregular,
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              horizontalSpacing(10),
              Expanded(
                flex: 1,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 0,
                      left: 5,
                      child: Image.asset(
                        ExplrImagePaths.hazelnuts,
                        height: 150.h,
                        width: 80.w,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
