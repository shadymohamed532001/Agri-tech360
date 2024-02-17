import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/details/widgets/details_view_body.dart';
import 'package:smartsoil/Feature/home/data/models/plant_model.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
    required this.plant,
  });

  final PlantModle plant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsViewBody(
        plant: plant,
      ),
    );
  }
}
