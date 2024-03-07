import 'dart:io';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/store/data/datasources/store_data_sources.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class StoreDataSourcesImpl extends StoreDataSources {
  @override
  Future<List<StoreProductModel>> getProducts() async {
    String token = await LocalServices.getData(key: 'token');

    var response = await ApiServices.getData(
      endpoint: '$baseUrl$productsesendpoint',
      token: token,
    );

    List<StoreProductModel> products = [];

    if (response.containsKey('data')) {
      for (var product in response['data']) {
        products.add(StoreProductModel.fromJson(product));
      }
    }
    return products;
  }

  @override
  Future<void> addProduct({
    required String name,
    required String price,
    required String description,
    required String tags,
    required String seller,
    required List<File> images,
    required File image,
  }) async {
    String token = await LocalServices.getData(key: 'token');

    List<MultipartFile> imageFiles = [];
    // Add primary image
    imageFiles.add(
      await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
    );
    // Add additional images
    for (var img in images) {
      imageFiles.add(
        await MultipartFile.fromFile(
          img.path,
          filename: img.path.split('/').last,
        ),
      );
    }

    FormData formData = FormData.fromMap({
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'seller': seller,
      'image': imageFiles[
          0], // Assuming you want to use the first image as the primary image
      'images': imageFiles
          .sublist(1), // Exclude the primary image from additional images
    });

    try {
      // Make the POST request using provided postFormData method
      await ApiServices.postFormData(
        endpoint: addproductsesendpoint,
        formData: formData,
        token: token,
      );
    } catch (e) {
      // Handle error
      print('Error adding product: $e');
    }
  }
}
