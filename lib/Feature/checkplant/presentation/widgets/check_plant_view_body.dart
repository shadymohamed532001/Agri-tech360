import 'package:flutter/material.dart';
import 'package:smartsoil/core/helper/extentaions.dart';
import 'package:smartsoil/core/routing/routes.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';
import 'package:smartsoil/core/widgets/app_bottom.dart';

class CheckPlantViewBody extends StatefulWidget {
  const CheckPlantViewBody({super.key});

  @override
  State<CheckPlantViewBody> createState() => _CheckPlantViewBodyState();
}

class _CheckPlantViewBodyState extends State<CheckPlantViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'CheckPlantViewBody Sooon',
            style: AppStyle.font15PrimaryBold,
          ),
        ),
        CustomBottom(
          onPressed: () {
            context.pushNamedAndRemoveUntil(
              Routes.homeViewRoute,
              routePredicate: (route) => false,
            );
          },
          bottomtext: 'back',
        )
      ],
    );
  }
}
