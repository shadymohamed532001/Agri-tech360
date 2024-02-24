import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class TraidmentProductCard extends StatelessWidget {
  const TraidmentProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.navigateTo(
          routeName: Routes
              .traidmentProductDetailsViewRoute), // i well push with argument to push product Model
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: ColorManger.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 50,
              spreadRadius: 5,
              offset: const Offset(3, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            verticalSpacing(15),
            Flexible(
              child: SizedBox(
                height: 120.h,
                child: Stack(
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: SizedBox(
                          width: 130.w,
                          height: 200.h,
                          child: FancyShimmerImage(
                            imageUrl: '',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.h, top: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: ColorManger.yellowColor,
                        size: 20,
                      ),
                      horizontalSpacing(2),
                      Text(
                        '4,7',
                        style: AppStyle.font12Blackmedium,
                      ),
                      horizontalSpacing(4),
                      Text(
                        '(77 Reviews)',
                        style: AppStyle.font12Greyregular,
                      ),
                    ],
                  ),
                  verticalSpacing(3),
                  Text(
                    'Spectacid IMMUNOX',
                    style: AppStyle.font12Blackmedium,
                  ),
                  verticalSpacing(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$333 ',
                        style: AppStyle.font14Blacksemibold,
                      ),
                      Container(
                        width: 40.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: ColorManger.primaryColor,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              bottomRight: Radius.circular(24)),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Iconsax
                                .heart, //  if in favoridr Heart is HEART5 ELSE HeartOnly
                            color: ColorManger.whiteColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
