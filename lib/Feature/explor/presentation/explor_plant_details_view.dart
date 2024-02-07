import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/logic/cubit/explor_cubit.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/explor_plant_details_squear_continer.dart';
import 'package:smartsoil/core/Di/service_locator.dart';
import 'package:smartsoil/core/helper/extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ExplorPlantDetailsView extends StatelessWidget {
  const ExplorPlantDetailsView({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => serviceLocator.get<ExplorCubit>(),
        child: BlocBuilder<ExplorCubit, ExplorState>(
          builder: (context, state) {
            var explorData =
                BlocProvider.of<ExplorCubit>(context).explorData()[index];
            return CustomScrollView(
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
                            explorData.plantimagepath,
                            height: 430.h,
                            width: 430.w,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 24.h, horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            verticalSpacing(35),
                            verticalSpacing(43),
                            Text(
                              explorData.plantName,
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
                                        'Every ${explorData.numberOfWater} wk',
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
                                        explorData.stateofTemperature,
                                  ),
                                ),
                                verticalSpacing(16),
                                FadeInRight(
                                  child: ExplorPlantDetailsSquearContiner(
                                    explorPlantDetailsSquearIcon: const Icon(
                                      Icons.rotate_90_degrees_cw_outlined,
                                    ),
                                    explorPlantDetailsSquearText:
                                        '${explorData.minimumdegrees}-${explorData.maxmumdegrees} C',
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
                                                  color:
                                                      ColorManger.primaryColor,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    verticalSpacing(16),
                                    Text(
                                      explorData.plantLongDescription,
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
          },
        ),
      ),
    );
  }
}
