import 'package:equatable/equatable.dart';
import 'package:smartsoil/Feature/home/data/models/plant_model.dart';

class PlantModelClass extends Equatable {
  final PlantModle plantModle;

  const PlantModelClass({
    required this.plantModle,
  });

  @override
  List<Object?> get props => [
        plantModle,
      ];
}
