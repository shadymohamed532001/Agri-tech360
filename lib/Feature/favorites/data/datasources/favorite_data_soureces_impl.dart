import 'package:smartsoil/Feature/favorites/data/datasources/favorite_data_soureces.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class FavoritesDataSoureceImpl extends FavoriteDataSource {
  @override
  Future<List<FavoriteData>> getFavorites() async {
    String token = await LocalServices.getData(key: 'token');
    Map<String, dynamic> response = await ApiServices.getData(
      endpoint: '$baseUrl$favoritesendpoint',
      token: token,
    );

    print(response);
    List<FavoriteData> favoriteResult = [];

    if (response.containsKey('data')) {
      if (response['data'] is List) {
        // Iterate over each item in the 'data' list and parse it into FavoriteData
        favoriteResult = List<FavoriteData>.from(
          response['data'].map((item) => FavoriteData.fromJson(item['product'])),
        );
      } else {
        // If 'data' is not a list, parse it as a single FavoriteData item
        favoriteResult.add(FavoriteData.fromJson(response['data']['product']));
      }
    }

    return favoriteResult;
  }
}