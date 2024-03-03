import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smartsoil/Feature/details/widgets/over_all_rating.dart';
import 'package:smartsoil/Feature/details/widgets/rating_indicator.dart';
import 'package:smartsoil/Feature/details/widgets/user_review_card.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/custom_sliver_app_bar.dart';

class RatingAndReviewBody extends StatelessWidget {
  const RatingAndReviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            const CustomSliverAppBar(
              titleText: 'Reviews & Ratings',
              centerTitle: false,
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rating and review are verfied and are from people who use the same type of device that you user',
                    style: AppStyle.font12Blackregular,
                  ),
                  verticalSpacing(15),
                  const OverAllRating(),
                  verticalSpacing(10),
                  const RatingIndicator(
                    rating: 4,
                  ),
                  verticalSpacing(40),
                  const UserReviewCard(),
                  verticalSpacing(20),
                  const UserReviewCard(),
                  verticalSpacing(20),
                  const UserReviewCard(),
                  verticalSpacing(20),
                  const UserReviewCard(),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
