// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_classfiction_cubit.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.cubit,
  });

  final PlantClassfictionCubite cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
          color: ColorManger.whiteColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          )),
      child: Column(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () async {
                await cubit.uploadImageFromGalleryModel(
                  picke: ImagePicker(),
                );
                context.pop();
                await cubit.uploadImageToModel(image: cubit.image!);
              },
              child: const Text(
                'Select From Gallary',
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () async {
                await cubit.uploadImageFromCameraModel(
                  picke: ImagePicker(),
                );
                context.pop();
                await cubit.uploadImageToModel(image: cubit.image!);
              },
              child: const Text(
                'Select From Gallary',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
