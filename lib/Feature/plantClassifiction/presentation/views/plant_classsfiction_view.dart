import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/plant_care_view_body.dart';

class PlantCareView extends StatelessWidget {
  const PlantCareView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlantCareViewBody(),
    );
  }
}
