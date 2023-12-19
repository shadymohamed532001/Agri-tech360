import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/listview_of_explor_plant_information.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_search_bar.dart';

class ExplorViewBody extends StatefulWidget {
  const ExplorViewBody({super.key});

  @override
  State<ExplorViewBody> createState() => _ExplorViewBodyState();
}

class _ExplorViewBodyState extends State<ExplorViewBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          color: ColorManger.primaryColor,
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInDown(
                  child: Text(
                    '   Find your Plant',
                    style: AppStyle.font16Whitebold,
                  ),
                ),
                verticalSpacing(16),
                FadeInRight(child: const AppSearchBar()),
                verticalSpacing(60),
                Expanded(
                  child: FadeInDown(
                    child: const ListOfExplorPlantInformation(),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
