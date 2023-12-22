import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

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
        Positioned(
          top: 320.h,
          left: 45.w,
          child: FadeInRight(
            duration: const Duration(milliseconds: 600),
            child: Image.asset(
              'assets/images/treeee.png',
              height: 400.h,
              width: 450.w,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Precious App',
                  style: AppStyle.font12Greyregular,
                ),
                verticalSpacing(20),
                CustomBottom(
                  backgroundColor: ColorManger.primaryColor,
                  bottomtext: 'Open Gallary',
                  onPressed: () {
                    pickedImage();
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
