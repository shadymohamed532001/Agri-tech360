import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'
    as animations;
import 'package:smartsoil/Feature/home/presentation/widgets/recntly_viewed_item.dart';

class SeeAllItems extends StatelessWidget {
  const SeeAllItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        right: 27.w,
        left: 14.w,
        top: 20.h,
        bottom: 15.h,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          animations.AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 700),
        child: animations.SlideAnimation(
          horizontalOffset: -150.w,
          curve: Curves.fastLinearToSlowEaseIn,
          child: const animations.FadeInAnimation(
            child: RecntlyViewedItem(),
          ),
        ),
      ),
      separatorBuilder: (context, index) => Divider(
        height: 20.h,
      ),
      itemCount: 10,
    );
  }
}
