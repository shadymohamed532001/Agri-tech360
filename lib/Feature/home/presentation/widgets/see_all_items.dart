import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'
    as animations;
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/core/widgets/popular_card.dart';

class SeeAllItems extends StatelessWidget {
  const SeeAllItems({
    Key? key,
    required this.plants,
  }) : super(key: key);

  final List<PlantModle> plants;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        right: 27.w,
        left: 14.w,
        top: 10.h,
        bottom: 10.h,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          animations.AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 700),
        child: animations.SlideAnimation(
          horizontalOffset: -150.w,
          curve: Curves.fastLinearToSlowEaseIn,
          child: animations.FadeInAnimation(
            child: PopularCard(
              plant: plants[index],
            ),
          ),
        ),
      ),
      separatorBuilder: (context, index) => Divider(
        height: 30.h,
      ),
      itemCount: plants.length,
    );
  }
}
