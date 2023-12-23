import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/heal_your_crop_and_plant_text.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';
import 'package:smartsoil/core/widgets/precious_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ImagePicker picker = ImagePicker();
  File? image;

  pickedImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedFile!.path);
    });
  }

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
                Container(
                  padding: const EdgeInsets.all(16),
                  width: 343.w,
                  height: 186.h,
                  decoration: BoxDecoration(
                    color: ColorManger.whiteColor,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManger.greyColor.withOpacity(0.2),
                        spreadRadius: 2.5,
                        blurRadius: 15,
                        offset: const Offset(3, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  ImagesAssetsManger.cameraImage,
                                  width: 52.w,
                                  height: 52.h,
                                ),
                                verticalSpacing(8),
                                const Text(
                                  'Take a\npicture',
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 19,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  ImagesAssetsManger.phoneImage,
                                  width: 52.w,
                                  height: 52.h,
                                ),
                                verticalSpacing(8),
                                const Text(
                                  'Get the\nresult',
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 19,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Image.asset(
                                  ImagesAssetsManger.diagnosisImage,
                                  width: 52.w,
                                  height: 52.h,
                                ),
                                verticalSpacing(8),
                                const Text(
                                  'Get \ndiagnosis',
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      verticalSpacing(16),
                      Expanded(
                        child: CustomBottom(
                          backgroundColor: ColorManger.primaryColor,
                          bottomtext: 'Open Gallary',
                          onPressed: () {
                            pickedImage();
                          },
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
  }
}
