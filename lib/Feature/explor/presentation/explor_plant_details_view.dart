import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/explor_plant_details_squear_continer.dart';
import 'package:smartsoil/core/helper/extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ExplorPlantDetailsView extends StatelessWidget {
  const ExplorPlantDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Stack(
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
                  top: 180.h,
                  left: 15.w,
                  child: FadeInRight(
                    duration: const Duration(milliseconds: 600),
                    child: Image.asset(
                      ImagesAssetsManger.floweImage,
                      height: 451.h,
                      width: 451.w,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacing(35),
                      verticalSpacing(43),
                      Text(
                        'Ageratum',
                        style: AppStyle.font24blakBold,
                      ),
                      verticalSpacing(45),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInRight(
                            child: const ExplorPlantDetailsSquearContiner(
                              explorPlantDetailsSquearIcon: Icon(
                                Icons.water_drop_outlined,
                                size: 38,
                              ),
                              explorPlantDetailsSquearText: 'Every 2 wk',
                            ),
                          ),
                          verticalSpacing(16),
                          FadeInLeft(
                            child: const ExplorPlantDetailsSquearContiner(
                              explorPlantDetailsSquearIcon: Icon(
                                Icons.wb_sunny_outlined,
                                size: 38,
                              ),
                              explorPlantDetailsSquearText: 'Diffused',
                            ),
                          ),
                          verticalSpacing(16),
                          FadeInRight(
                            child: const ExplorPlantDetailsSquearContiner(
                              explorPlantDetailsSquearIcon:
                                  Icon(Icons.rotate_90_degrees_cw_outlined),
                              explorPlantDetailsSquearText: '18-25 C',
                            ),
                          ),
                          verticalSpacing(32),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'About',
                                    style: AppStyle.font24blakBold,
                                  ),
                                  Text(
                                    'More',
                                    style: AppStyle.font16LightGreymedium
                                        .copyWith(
                                            color: ColorManger.primaryColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              verticalSpacing(16),
                              Text(
                                'Contrary to popular belief not simply random It has root in a piece of classical Latin literature from 45BC, making it over 2000 years old.Contrary to popular belief simply random It has root in a piece of classical Latin.',
                                style: AppStyle.font12Greyregular,
                              ),
                              Text(
                                'Contrary to popular belief not simply random It has root in a piece of classical Latin literature from 45BC, making it over 2000 years old.Contrary to popular belief simply random It has root in a piece of classical Latin.',
                                style: AppStyle.font12Greyregular,
                              ),
                              Text(
                                'Contrary to popular belief not simply random It has root in a piece of classical Latin literature from 45BC, making it over 2000 years old.Contrary to popular belief simply random It has root in a piece of classical Latin.',
                                style: AppStyle.font12Greyregular,
                              ),
                              Text(
                                'Contrary to popular belief not simply random It has root in a piece of classical Latin literature from 45BC, making it over 2000 years old.Contrary to popular belief simply random It has root in a piece of classical Latin.',
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
      ),
    );
  }
}
