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

class PopularCard extends StatelessWidget {
  const PopularCard({
    super.key,
    required this.plant,
  });
  final PlantModle plant;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(
        routeName: Routes.detailsViewRoute,
        arguments:
            PlantModelClass(plantModle: plant), // pass data to another screan
      ),
      child: Container(
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
                      ExplrImagePaths.bananas,
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
                      plant.name,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.font14Blacksemibold,
                    ),
                    verticalSpacing(8),
                    Text(
                      plant.shortDescription,
                      style: AppStyle.font10Greyregular,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}