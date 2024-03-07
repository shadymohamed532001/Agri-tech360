import 'dart:io';

import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';

abstract class StoreDataSources {
  Future<List<StoreProductModel>> getProducts();

  Future<void> addProduct({
    required String name,
    required String price,
    required String description,
    required String tags,
    required String seller,
    required List<File> images,
    required File image,
  });
}
