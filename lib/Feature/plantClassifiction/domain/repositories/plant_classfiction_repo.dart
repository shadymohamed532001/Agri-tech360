import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class PlantClassificationRepo {
  Future<File?> pickedImageFromGallary(ImagePicker picker);
  Future<File?> pickedImageFromCamira(ImagePicker picker);
}
