import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/helper/extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class DisabledSearchField extends StatelessWidget {
  const DisabledSearchField({
    super.key,
    this.onChanged,
    this.controller,
  });
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushName(Routes.searchViewRoute),
      child: Container(
        width: double.infinity,
        height: 45.h,
        decoration: BoxDecoration(
            color: ColorManger.whiteColor,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: Colors.grey,
            )),
        child: Row(
          children: [
            horizontalSpacing(15),
            Icon(Icons.search, color: ColorManger.greyColor),
            horizontalSpacing(15),
            Expanded(
              child: TextField(
                controller: controller,
                enabled: false,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: ColorManger.greyColor,
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: onChanged,
              ),
            )
          ],
        ),
      ),
    );
  }
}
