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
}
