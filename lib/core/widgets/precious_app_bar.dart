import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class PreciousAppBar extends StatelessWidget {
  const PreciousAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorManger.whiteColor.withOpacity(0.2),
      elevation: 0.0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        'Precious',
        style: AppStyle.font22PrimaryBold,
      ),
    );
  }
}
