import 'dart:io';

import 'package:smartsoil/Feature/plantClassifiction/data/models/plant_classfiction_model.dart';

abstract class PlantCareDataSource {
  Future<PlantCareModel> getClassficationData({required File image});
}
