import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/plantClassifiction/domain/repositories/plant_classfiction_repo.dart';

class PlantClassificationRepoImpl extends PlantClassificationRepo {
  @override
  Future<File?> pickedImageFromGallary(ImagePicker picker) async {
    try {
      // Use the provided ImagePicker instance to pick an image from the gallery
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      // If an image is picked, return it as a File
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        // If no image is picked, return null
        return null;
      }
    } catch (e) {
      // Handle any errors that occur during image picking
      print('Error picking image: $e');
      return null;
    }
  }

  @override
  Future<File?> pickedImageFromCamira(ImagePicker picker) async {
    try {
      // Use the provided ImagePicker instance to pick an image from the cammera
      XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
      // If an image is picked, return it as a File
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        // If no image is picked, return null
        return null;
      }
    } catch (e) {
      // Handle any errors that occur during image picking
      print('Error picking image: $e');
      return null;
    }
  }
}
