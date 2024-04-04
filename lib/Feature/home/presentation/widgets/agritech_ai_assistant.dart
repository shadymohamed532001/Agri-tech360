import 'package:flutter/material.dart';
import 'package:smartsoil/core/helper/naviagtion_extentaions.dart';
import 'package:smartsoil/core/helper/spacing.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class AgriteachAiAssistant extends StatelessWidget {
  const AgriteachAiAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Agritech Ai Assistant',
              style: AppStyle.font22BlackBold,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: GestureDetector(
                onTap: () {
                  context.navigateTo(
                    routeName: Routes.chatViewRoute,
                  );
                },
                child: Container(
                  width: 35,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorManger.whiteColor.withOpacity(0.7),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  ),
                ),
              ),
            )
          ],
        ),
        verticalSpacing(8),
        Text(
          'Test your soil Veggies, fruits, grains for rich soil. Legumes, cover crops to fix depleted soil. Ask local experts for your best options.',
          style: AppStyle.font12Greyregular,
        ),
      ],
    );
  }
}
