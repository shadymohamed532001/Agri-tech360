import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class ExplorPlantInformation extends StatelessWidget {
  const ExplorPlantInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 175.h,
        decoration: BoxDecoration(
          color: ColorManger.whiteColor,
          borderRadius: BorderRadius.circular(
            30,
          ),
          boxShadow: [
            BoxShadow(
              color: ColorManger.greyColor.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 15,
              offset: const Offset(3, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(36),
                  Text(
                    'Ageratum',
                    style: AppStyle.font22BlackBold,
                  ),
                  verticalSpacing(16),
                  Text(
                    'Contrary to popular belief not\nsimply random It has root in a piece \nof classical Latin literature from 45\nBC, making it over 2000 years old.',
                    style: AppStyle.font12Greyregular,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/flower.png',
                height: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
