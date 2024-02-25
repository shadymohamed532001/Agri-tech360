import 'dart:io';

import 'package:smartsoil/Feature/plantClassifiction/data/models/plant_classfiction_model.dart';

abstract class PlantCareDataSource {
  Future<ClassfictionModel> getClassficationData({required File image});
}
