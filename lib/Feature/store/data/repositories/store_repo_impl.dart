import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/store/data/datasources/store_data_sources.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/Feature/store/domain/repositories/store_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class StoreRepoImpl extends StoreRepo {
  final StoreDataSources storeDataSources;

  StoreRepoImpl({required this.storeDataSources});
  @override
  Future<Either<Failure, List<StoreProductModel>>> getStoreData() async {
    try {
      List<StoreProductModel> products = await storeDataSources.getProducts();
      return right(products);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> addProductData({
    required String name,
    required String price,
    required String description,
    required String tags,
    required String seller,
    required List<File> images,
    required File image,
  }) async {
    try {
      final storeProductModel = await storeDataSources.addProduct(
        name: name,
        price: price,
        description: description,
        tags: tags,
        seller: seller,
        images: images,
        image: image,
      );
      return right(storeProductModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  void removeImageFromList(
      {required int index, required List<File> imageList}) {
    if (imageList.isNotEmpty) {
      imageList.removeAt(index);
    }
  }

  @override
  Future<List<File>> pickedImagesFromGallary(ImagePicker picker) async {
    try {
      List<File> imageList = [];

      final List<XFile> selectedImages = await picker.pickMultiImage();
      if (selectedImages.isNotEmpty) {
        // Convert XFile to File
        for (var xFile in selectedImages) {
          // Create a File instance using the path
          File file = File(xFile.path);

          // Ensure the file exists before adding it to the list
          if (await file.exists()) {
            imageList.add(file);
          }
        }
      }
      return imageList;
    } catch (e) {
      print('Error picking images: $e');
      return []; // Return an empty list on error
    }
  }
}
