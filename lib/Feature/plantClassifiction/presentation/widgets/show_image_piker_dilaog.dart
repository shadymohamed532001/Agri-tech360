import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

Future<void> showImagePikerDialog(
  BuildContext context, {
  required Function()? cameraFUC,
  required Function()? gallaryFUC,
  required Function()? removeFUC,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorManger.whiteColor.withOpacity(0.9),
                ColorManger.lightpinkColor,
                ColorManger.lightpinkColor.withOpacity(0.7),
              ],
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpacing(10),
                Text(
                  'Choose your Image',
                  style: AppStyle.font17Blacksemibold,
                  textAlign: TextAlign.center,
                ),
                verticalSpacing(10),
                ListTile(
                  onTap: cameraFUC,
                  leading: Icon(
                    Iconsax.camera,
                    color: ColorManger.blackColor,
                  ),
                  title: Text(
                    'Camera',
                    style: AppStyle.font14Blacksemibold,
                  ),
                ),
                ListTile(
                  onTap: gallaryFUC,
                  leading: Icon(
                    Icons.browse_gallery,
                    color: ColorManger.blackColor,
                  ),
                  title: Text(
                    'Gallery',
                    style: AppStyle.font14Blacksemibold,
                  ),
                ),
                ListTile(
                  onTap: removeFUC,
                  leading: Icon(
                    Icons.remove_circle,
                    color: ColorManger.blackColor,
                  ),
                  title: Text(
                    'Remove',
                    style: AppStyle.font14Blacksemibold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
