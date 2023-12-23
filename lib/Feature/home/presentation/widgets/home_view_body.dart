import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/guidance_user_to_heal_his_crop.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/heal_your_crop_and_plant_text.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/list_of_weather_degree_item.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
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
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w)
                .copyWith(bottom: 0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                  const ListOfWeatherDegreeItem(),
                  verticalSpacing(40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Recently viewed',
                      style: AppStyle.font22BlackBold,
                    ),
                  ),
                  verticalSpacing(24),
                  const ListOfRecntlyViewedItem()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ListOfRecntlyViewedItem extends StatelessWidget {
  const ListOfRecntlyViewedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100.h,
        width: double.infinity,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.none,
          itemCount: 22,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(right: 16),
              child: RecntlyViewedItem(),
            );
          },
        ));
  }
}

class RecntlyViewedItem extends StatelessWidget {
  const RecntlyViewedItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: ColorManger.whiteColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -35,
                  left: -20,
                  child: Image.asset(
                    ImagesAssetsManger.flowe_2Image,
                    height: 130.h,
                    width: 100.w,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ageratum',
                    style: AppStyle.font14Blacksemibold,
                  ),
                  verticalSpacing(8),
                  Text(
                    'Contrary to popular belief not simply random It has root in a piece.',
                    style: AppStyle.font10Greyregular,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
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
