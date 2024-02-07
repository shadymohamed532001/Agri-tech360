import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/profile/presentation/widgets/Custom_list_tittle.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_image_assets.dart';

class GeneralProfileComponents extends StatelessWidget {
  const GeneralProfileComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomListTittle(
          title: const Text('All Orders'),
          leading: Image.asset(
            ImagesAssetsManger.applogoBlack,
            width: 30.w,
            height: 30.h,
          ),
          trailing: const Icon(Icons.arrow_right),
        ),
        CustomListTittle(
          title: const Text('Wishlist'),
          leading: Image.asset(
            ImagesAssetsManger.applogoBlack,
            width: 30.w,
            height: 30.h,
          ),
          trailing: const Icon(Icons.arrow_right),
        ),
        CustomListTittle(
          title: const Text('Viewed recently'),
          leading: Image.asset(
            ImagesAssetsManger.applogoBlack,
            width: 30.w,
            height: 30.h,
          ),
          trailing: const Icon(Icons.arrow_right),
        ),
        CustomListTittle(
          title: const Text('Addresses'),
          leading: Image.asset(
            ImagesAssetsManger.applogoBlack,
            width: 30.w,
            height: 30.h,
          ),
          trailing: const Icon(Icons.arrow_right),
        ),
        verticalSpacing(8),
        Divider(
          color: ColorManger.greyColor,
          height: 1,
        ),
      ],
    );
  }
}