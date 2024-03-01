import 'package:smartsoil/Feature/favorites/data/models/change_favorites_model.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';

abstract class FavoriteDataSource {
  Future<FavoriteModel> getFavorites({
    required String userToken,
  });

  Future<AddOrRemoveFavorite> addOrRemoveFavorite({
    required int productId,
    required String userToken,
  });
}
