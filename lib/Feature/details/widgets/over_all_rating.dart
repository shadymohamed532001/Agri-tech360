import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartsoil/Feature/details/widgets/rating_liner_indector_and_value.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class OverAllRating extends StatelessWidget {
  const OverAllRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.5',
            style: AppStyle.font32BlackBold.copyWith(
              fontSize: 50.sp,
            ),
          ),
        ),
        const Expanded(
            flex: 7,
            child: Column(
              children: [
                RatingLinerIndectorAndValue(
                  ratingValue: '5',
                  value: 1,
                ),
                RatingLinerIndectorAndValue(
                  ratingValue: '4',
                  value: 0.8,
                ),
                RatingLinerIndectorAndValue(
                  ratingValue: '3',
                  value: 0.6,
                ),
                RatingLinerIndectorAndValue(
                  ratingValue: '2',
                  value: 0.4,
                ),
                RatingLinerIndectorAndValue(
                  ratingValue: '1',
                  value: 0.2,
                ),
              ],
            ))
      ],
    );
  }
}
