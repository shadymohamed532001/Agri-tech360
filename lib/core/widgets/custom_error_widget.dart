import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.onPressed,
    required this.error,
  });

  final VoidCallback onPressed;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.wifi_off_rounded,
              color: ColorManger.primaryColor,
              size: 72.h,
            ),
            SizedBox(height: 16.h),
            Text(
              error == 'No Internet Connection' ? '$error. Tap to try' : error,
              style: AppStyle.font10Greyregular.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            if (error == 'No Internet Connection') ...[
              SizedBox(height: 8.h),
              Text(
                'Connect to the internet and try again.',
                style: AppStyle.font12Blackmedium,
                textAlign: TextAlign.center,
              ),
            ],
            SizedBox(height: 16.h),
            TextButton(
              onPressed: onPressed,
              child: Text(
                'Try Again',
                style: AppStyle.font14Blacksemibold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
