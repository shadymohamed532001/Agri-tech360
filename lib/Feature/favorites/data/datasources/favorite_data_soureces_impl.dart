import 'package:smartsoil/Feature/favorites/data/datasources/favorite_data_soureces.dart';
import 'package:smartsoil/Feature/favorites/data/models/change_favorites_model.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';

class FavoritesDataSoureceImpl extends FavoriteDataSource {
  @override
  Future<AddOrRemoveFavorite> addOrRemoveFavorite(
      {required int productId, required String userToken}) async {
    final response = await ApiServices.postData(
      endpoint: addOrRemoveFavoriteendpoint,
      token: userToken,
      data: {
        'product': productId,
      },
    );
    return AddOrRemoveFavorite.fromJson(response);
  }

  @override
  Future<FavoriteModel> getFavorites({required String userToken}) async {
    final response = await ApiServices.getData(
      endpoint: favoritesendpoint,
      token: userToken,
    );
    return FavoriteModel.fromJson(response);
  }
}
