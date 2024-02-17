import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/plantClassifiction/presentation/widgets/check_plant_view_body.dart';

class PlantClassficationView extends StatelessWidget {
  const PlantClassficationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PlantClassficationViewBody(),
    );
  }
}
