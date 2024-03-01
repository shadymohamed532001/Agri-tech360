import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/favorites/data/models/change_favorites_model.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class FavoritesRepo {
  Future<Either<Failure, FavoriteModel>> getFavorites({
    required String userToken,
  });

  Future<Either<Failure, AddOrRemoveFavorite>> addOrRemoveFavorite({
    required int productId,
    required String userToken,
  });
}
