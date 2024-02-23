import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/datasources/plant_care_data_sources.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/models/plant_classfiction_model.dart';
import 'package:smartsoil/Feature/plantClassifiction/domain/repositories/plant_care_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class PlantCareRepoImpl extends PlantCareRepo {
  final PlantCareDataSource plantCareDataSource;

  PlantCareRepoImpl({required this.plantCareDataSource});
  @override
  Future<File?> pickedImageFromGallary(ImagePicker picker) async {
    try {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<File?> pickedImageFromCamira(ImagePicker picker) async {
    try {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        return File(pickedFile.path);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Either<Failure, PlantCareModle>> getClassficationData(
      {required File image}) async {
    try {
      final plantResponseModel =
          await plantCareDataSource.getClassficationData(image: image);
      return right(plantResponseModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}