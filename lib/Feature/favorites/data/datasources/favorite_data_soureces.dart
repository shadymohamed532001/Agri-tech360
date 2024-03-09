import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';

abstract class FavoriteDataSource {
  Future<List<FavoriteData>> getFavorites();

  Future<void> addOrRemoveFavorite({required int productId});

 
}
