import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class EmptyPlantClassfiction extends StatelessWidget {
  const EmptyPlantClassfiction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: ColorManger.whiteColor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: -60,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: ColorManger.whiteColor,
              child: const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                  'assets/images/women_hold_tree.jpg',
                ),
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color.fromARGB(255, 223, 221, 220),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 40.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Please Upload Image ',
                          style: AppStyle.font22BlackBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color.fromARGB(255, 223, 221, 220),
              ),
            ),
          ),
          Positioned.fill(
            top: 150,
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Image.asset(
                'assets/images/no_product.jpg',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
