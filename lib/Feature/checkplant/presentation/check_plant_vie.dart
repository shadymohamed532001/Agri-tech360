import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/checkplant/presentation/widgets/check_plant_view_body.dart';

class CheckPlantView extends StatelessWidget {
  const CheckPlantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CheckPlantViewBody(),
    );
  }
}
