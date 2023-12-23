import 'package:flutter/material.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class HealYourCropAndPlantText extends StatelessWidget {
  const HealYourCropAndPlantText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Heal your crop',
          style: AppStyle.font22BlackBold,
        ),
        verticalSpacing(8),
        Text(
          'Contrary to popular belief not simply random It has root in a piece of classical Latin literature from 45BC, making it over ',
          style: AppStyle.font12Greyregular,
        ),
      ],
    );
  }
}
