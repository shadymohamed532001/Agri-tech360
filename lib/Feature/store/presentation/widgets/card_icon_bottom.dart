import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class CardIconBottom extends StatelessWidget {
  const CardIconBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Badge(
        label: const Text('5'),
        child: Icon(
          Iconsax.shopping_bag,
          color: ColorManger.whiteColor,
        ),
      ),
    );
  }
}
