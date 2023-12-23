import 'package:flutter/material.dart';
import 'package:smartsoil/core/themaing/app_styles.dart';

class PreciousAppBar extends StatelessWidget {
  const PreciousAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Precious',
      style: AppStyle.font22PrimaryBold,
    );
  }
}
