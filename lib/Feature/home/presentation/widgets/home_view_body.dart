import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/guidance_user_to_heal_his_crop.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/heal_your_crop_and_plant_text.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/precious_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const PreciousAppBar(),
                verticalSpacing(40),
                const HealYourCropAndPlantText(),
                verticalSpacing(16),
                const GuidanceUserToHealHisCrop(),
                verticalSpacing(40),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Daily Forecast',
                    style: AppStyle.font22BlackBold,
                  ),
                ),
                verticalSpacing(24),
                const ListOfWeatherDegreeItem()
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ListOfWeatherDegreeItem extends StatelessWidget {
  const ListOfWeatherDegreeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.h,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              right: 16.w,
            ),
            child: const WeatherDegreeItem(),
          );
        },
      ),
    );
  }
}

class WeatherDegreeItem extends StatelessWidget {
  const WeatherDegreeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                const Icon(
                  Icons.cloud_off,
                  size: 33,
                ),
                verticalSpacing(8),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_upward,
                        size: 17,
                      ),
                      horizontalSpacing(2),
                      Expanded(
                        child: Text(
                          '27°C',
                          style: AppStyle.font12Blackregular,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}


//Fuction of Open Gallery
// ----------------------------------------------------------------
  // final ImagePicker picker = ImagePicker();
  // File? image;

  // pickedImage() async {
  //   XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     image = File(pickedFile!.path);
  //   });
  // }
  // pickedImage();
