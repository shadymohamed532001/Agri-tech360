import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/presentation/information_about_plant.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/explor_plant_details_squear_continer.dart';
import 'package:smartsoil/core/helper/extentaions.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ExplorPlantDetailsView extends StatelessWidget {
  const ExplorPlantDetailsView({super.key, required this.index});
  final int index;

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
                  top: 160.h,
                  left: 30.w,
                  child: FadeInRight(
                    duration: const Duration(milliseconds: 600),
                    child: Image.asset(
                      explorationData[index].plantimagepath,
                      height: 430.h,
                      width: 430.w,
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
                        explorationData[index].plantName,
                        style: AppStyle.font24blakBold,
                      ),
                      verticalSpacing(45),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FadeInRight(
                            child: ExplorPlantDetailsSquearContiner(
                              explorPlantDetailsSquearIcon: const Icon(
                                Icons.water_drop_outlined,
                                size: 38,
                              ),
                              explorPlantDetailsSquearText:
                                  'Every ${explorationData[index].numberOfWater} wk',
                            ),
                          ),
                          verticalSpacing(16),
                          FadeInLeft(
                            child: ExplorPlantDetailsSquearContiner(
                              explorPlantDetailsSquearIcon: const Icon(
                                Icons.wb_sunny_outlined,
                                size: 38,
                              ),
                              explorPlantDetailsSquearText:
                                  explorationData[index].stateofTemperature,
                            ),
                          ),
                          verticalSpacing(16),
                          FadeInRight(
                            child: ExplorPlantDetailsSquearContiner(
                              explorPlantDetailsSquearIcon: const Icon(
                                Icons.rotate_90_degrees_cw_outlined,
                              ),
                              explorPlantDetailsSquearText:
                                  '${explorationData[index].minimumdegrees}-${explorationData[index].maxmumdegrees} C',
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
                                  TextButton(
                                    onPressed: () {
                                      // print(explorationData[0].plantName);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return InformationAboutPlant(
                                              index: index,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'More Information',
                                      style: AppStyle.font16LightGreymedium
                                          .copyWith(
                                        color: ColorManger.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              verticalSpacing(10),
                              Text(
                                explorationData[index].plantLongDescription,
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
