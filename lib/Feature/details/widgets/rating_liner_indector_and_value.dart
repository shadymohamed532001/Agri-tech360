import 'package:flutter/material.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class RatingLinerIndectorAndValue extends StatelessWidget {
  const RatingLinerIndectorAndValue({
    super.key,
    required this.ratingValue,
    required this.value,
  });

  final String ratingValue;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          ratingValue,
        ),
        horizontalSpacing(10),
        Expanded(
            flex: 7,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 11,
              backgroundColor: ColorManger.greyColor,
              borderRadius: BorderRadius.circular(8),
              valueColor: AlwaysStoppedAnimation(
                ColorManger.primaryColor,
              ),
            ))
      ],
    );
  }
}
