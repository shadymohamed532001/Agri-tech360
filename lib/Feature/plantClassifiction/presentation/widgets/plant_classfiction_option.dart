import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/plantClassifiction/logic/cubit/plant_care_cubit.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class PlantClassfictionOptions extends StatefulWidget {
  const PlantClassfictionOptions({super.key});

  @override
  State<PlantClassfictionOptions> createState() => _PlantCareOptionsState();
}

class _PlantCareOptionsState extends State<PlantClassfictionOptions> {
  bool isTabSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: ColorManger.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Expanded(
              child: CustomBottom(
                bottomHeight: 40.h,
                onPressed: () async {
                  setState(() {
                    isTabSelected = true;
                  });
                  var cubit = BlocProvider.of<PlantCareCubite>(context);
                  await cubit.uploadImageFromGalleryModel(
                    picke: ImagePicker(),
                  );
                  await cubit.uploadImageToModel(image: cubit.image!);
                },
                bottomtext: 'Open Gallary',
                textBottomStyle: isTabSelected
                    ? AppStyle.font14Whitesemibold
                    : AppStyle.font14Blacksemibold,
                backgroundColor: isTabSelected
                    ? ColorManger.primaryColor
                    : Colors.transparent,
                borderColor: isTabSelected
                    ? ColorManger.primaryColor
                    : Colors.transparent,
              ),
            ),
            horizontalSpacing(6),
            Expanded(
              child: CustomBottom(
                bottomHeight: 40.h,
                onPressed: () async {
                  setState(() {
                    isTabSelected = false;
                  });
                  var cubit = BlocProvider.of<PlantCareCubite>(context);
                  await cubit.uploadImageFromCameraModel(
                    picke: ImagePicker(),
                  );
                  await cubit.uploadImageToModel(image: cubit.image!);
                },
                bottomtext: 'Open Camera',
                textBottomStyle: !isTabSelected
                    ? AppStyle.font14Whitesemibold
                    : AppStyle.font14Blacksemibold,
                backgroundColor: !isTabSelected
                    ? ColorManger.primaryColor
                    : Colors.transparent,
                borderColor: !isTabSelected
                    ? ColorManger.primaryColor
                    : Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
