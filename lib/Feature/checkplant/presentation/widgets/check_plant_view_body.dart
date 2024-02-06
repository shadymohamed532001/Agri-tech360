import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/checkplant/presentation/widgets/check_plant_clip_paht.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class CheckPlantViewBody extends StatefulWidget {
  const CheckPlantViewBody({super.key});

  @override
  State<CheckPlantViewBody> createState() => _CheckPlantViewBodyState();
}

class _CheckPlantViewBodyState extends State<CheckPlantViewBody> {
  final ImagePicker picker = ImagePicker();
  File? image;

  pickedImage() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(
        pickedFile!.path,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: ChekPlantClipper(),
          child: Container(
            width: double.infinity,
            height: 650.h,
            color: ColorManger.lightpinkColor,
          ),
        ),
        Positioned(
          top: 160,
          right: 0,
          child: FadeInRight(
            child: Image.asset(
              'assets/images/sapar_tree.png',
              height: 270.h,
              width: 230.w,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'There’s a Plant\nfor everyone',
                      style: AppStyle.font22BlackBold,
                    ),
                    Image.asset(
                      'assets/images/menu.png',
                      height: 30.h,
                      color: Colors.grey[900],
                    ),
                  ],
                ),
                verticalSpacing(20),
                CustomBottom(
                  backgroundColor: ColorManger.primaryColor,
                  bottomWidth: 150.w,
                  onPressed: () {
                    pickedImage();
                  },
                  bottomtext: 'Select From Gallary',
                  textBottomStyle: AppStyle.font12Whitebold,
                ),
                verticalSpacing(200),
                Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(colors: [
                        ColorManger.primaryColor,
                        ColorManger.greyColor
                      ]),
                      color: ColorManger.greyColor,
                    ),
                    child: image == null
                        ? const Text('')
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  image!,
                                ),
                              ),
                            ),
                          ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
