import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_plant_models.dart';
import 'package:smartsoil/Feature/details/widgets/information_sliver_app_bar.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class DescriptionViewBody extends StatelessWidget {
  const DescriptionViewBody({super.key, required this.plant});
  final PlantModle plant;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          sliver: InformationSliverAppBar(
            plant: plant,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(10),
                Text(
                  'Description',
                  style: AppStyle.font22BlackBold,
                ),
                verticalSpacing(10),
                Text(
                  plant.longDescription,
                  style: AppStyle.font14lightblackmdeium,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
