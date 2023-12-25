import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/logic/cubit/home_cubit.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class WeatherDegreeItem extends StatelessWidget {
  const WeatherDegreeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 82.w,
              height: 108.h,
              decoration: BoxDecoration(
                color: ColorManger.whiteColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: ColorManger.greyColor.withOpacity(0.12),
                    spreadRadius: 1,
                    blurRadius: 22,
                    offset: const Offset(3, 0),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 16.w,
                ),
                child: Column(
                  children: [
                    Text(
                      '26 Dec',
                      style: AppStyle.font14Blackregular,
                    ),
                    verticalSpacing(8),
                    const Icon(Icons.cloud_download),
                    verticalSpacing(8),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_upward,
                            size: 16,
                          ),
                          horizontalSpacing(2),
                          Expanded(
                            child: Text(
                              ('22°C'),
                              style: AppStyle.font12Blackregular,
                            ),
                          )
                        ],
                      ),
                    ),
                    verticalSpacing(4),
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_downward,
                            size: 16,
                          ),
                          horizontalSpacing(2),
                          Expanded(
                            child: Text(
                              ('18°C'),
                              style: AppStyle.font12Blackregular,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
