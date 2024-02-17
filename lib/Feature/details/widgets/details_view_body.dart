import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/details/widgets/more_information_text_bottom.dart';
import 'package:smartsoil/Feature/details/widgets/squear_details_continer.dart';
import 'package:smartsoil/Feature/home/data/models/plant_model.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/line_back_ground.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.plant});

  final PlantModle plant;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Stack(
            children: [
              const LineBackGround(),
              Positioned(
                top: 50.h,
                left: 15.w,
                child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 28,
                  ),
                ),
              ),
              Positioned(
                top: 160.h,
                left: 70.w,
                child: FadeInRight(
                  duration: const Duration(milliseconds: 600),
                  child: Image.asset(
                    ImagesAssetsManger.floweImage,
                    height: 430.h,
                    width: 430.w,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacing(80),
                    Text(
                      plant.name,
                      style: AppStyle.font24blakBold,
                    ),
                    verticalSpacing(45),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInRight(
                          child: SquearDetailsContiner(
                            explorPlantDetailsSquearIcon: const Icon(
                              Icons.water_drop_outlined,
                              size: 38,
                            ),
                            explorPlantDetailsSquearText:
                                plant.waterRequirement,
                          ),
                        ),
                        verticalSpacing(16),
                        FadeInLeft(
                          child: SquearDetailsContiner(
                            explorPlantDetailsSquearIcon: const Icon(
                              Icons.wb_sunny_outlined,
                              size: 38,
                            ),
                            explorPlantDetailsSquearText:
                                plant.sunlightRequirement,
                          ),
                        ),
                        verticalSpacing(16),
                        FadeInRight(
                          child: SquearDetailsContiner(
                            explorPlantDetailsSquearIcon: Image.asset(
                              ImagesAssetsManger.degreeiconImage,
                              width: 30.w,
                              height: 30.h,
                            ),
                            explorPlantDetailsSquearText: plant.minimumDegrees,
                          ),
                        ),
                        verticalSpacing(32),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'About',
                                  style: AppStyle.font24blakBold,
                                ),
                                MoreInformationTextBottom(
                                  plant: plant,
                                ),
                              ],
                            ),
                            verticalSpacing(10),
                            Text(
                              plant.longDescription,
                              maxLines: 10,
                              style: AppStyle.font12Greyregular,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
