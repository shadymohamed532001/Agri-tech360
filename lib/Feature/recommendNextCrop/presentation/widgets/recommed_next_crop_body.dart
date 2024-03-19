import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/recommendNextCrop/presentation/widgets/empty_recommedn_next_crpo.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/primary_header_continer.dart';

import 'custom_plant_recommend_bottom_sheet.dart';
import 'recommend_next_crop_content.dart';

class RecommedNextCropBody extends StatefulWidget {
  const RecommedNextCropBody({super.key});

  @override
  State<RecommedNextCropBody> createState() => _RecommedNextCropBodyState();
}

class _RecommedNextCropBodyState extends State<RecommedNextCropBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PrimaryHeaderContiner(
            height: MediaQuery.of(context).size.height * 0.18,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good afternoon,shady',
                              style: AppStyle.font18Whitesemibold,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'Let’s take care of the plants together',
                              style: AppStyle.font14Whiteregular,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return const CustomRecommendBottomSheet();
                                });
                          },
                          child: Image.asset(
                            'assets/images/menu_1.png',
                            height: 30.h,
                            width: 27.w,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                Image.asset(
                  ImagesAssetsManger.appLogo,
                  height: 80.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Agritech360',
                  style: AppStyle.font20blacksemibold,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  plantCareDescription,
                  style: AppStyle.font13Greymedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 66,
                ),
                const Visibility(
                  visible: false,
                  child: EmptyRecommedNextCrop(),
                ),
                const RecommendNextCropContent(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
