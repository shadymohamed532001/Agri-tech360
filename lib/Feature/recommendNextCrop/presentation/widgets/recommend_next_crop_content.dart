import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class RecommendNextCropContent extends StatelessWidget {
  const RecommendNextCropContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        width: double.infinity,
        height: 350.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: ColorManger.whiteColor,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Positioned(
              left: 0,
              right: 0,
              top: -50,
              child: CircleAvatar(
                radius: 62,
                backgroundColor: ColorManger.whiteColor,
                child: CircleAvatar(
                  // Make it in chased network image
                  // backgroundImage: image != null
                  //     ? NetworkImage('$baseUrl${classfictionModel.image}')
                  //     : null,
                  backgroundColor: Colors.transparent,
                  radius: 44,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  Text(
                    'classfictionModel.predictions',
                    style: AppStyle.font16blacksemibold,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'About this plant:',
                      style: AppStyle.font14blackmedium,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '  classfictionModel.description',
                      style: AppStyle.font12Greymedium,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    height: 15.h,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'About this plant:',
                      style: AppStyle.font14blackmedium,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '  classfictionModel.description',
                      style: AppStyle.font12Greymedium,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    height: 15.h,
                    thickness: 0.5,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'About this plant:',
                      style: AppStyle.font14blackmedium,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '  classfictionModel.description',
                      style: AppStyle.font12Greymedium,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    height: 15.h,
                    thickness: 0.5,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'About this plant:',
                      style: AppStyle.font14blackmedium,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'classfictionModel.description',
                      style: AppStyle.font12Greymedium,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    height: 15.h,
                    thickness: 0.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
