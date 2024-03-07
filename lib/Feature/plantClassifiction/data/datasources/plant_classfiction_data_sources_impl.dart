import 'dart:io';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/datasources/plant_classfiction_data_sources.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/models/classfiction_model.dart';
import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';

class PlantClassfictionDataSourceImpl extends PlantClassficationDataSource {
  @override
  Future<ClassfictionModel> getClassficationData({required File image}) async {
    final formData = FormData.fromMap(
      {
        'file': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      },
    );
    final headers = {
      "Authorization": "Bearer $usertoken",
      "Content-Type": "multipart/form-data",
    };

    final response = await ApiServices.postData(
      endpoint: classifyendPoint,
      data: formData,
      options: Options(
        headers: headers,
      ),
    );
    final plantCareResponse = ClassfictionModel.fromJson(response);
    return plantCareResponse;
  }
}
