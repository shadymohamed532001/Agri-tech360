import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';

abstract class StoreDataSources {
  Future<List<StoreProductModel>> getProducts();
}
