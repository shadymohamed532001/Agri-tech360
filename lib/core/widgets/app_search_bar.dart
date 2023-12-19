import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: TextFormField(
              onTapOutside: (edgeDraggingAutoScroller) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: ColorManger.greyColor,
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {},
              onFieldSubmitted: (value) {},
            ),
          )
        ],
      ),
    );
  }
}
