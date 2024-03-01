import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/favorites/data/datasources/favorite_data_soureces.dart';
import 'package:smartsoil/Feature/favorites/data/models/change_favorites_model.dart';
import 'package:smartsoil/Feature/favorites/data/models/favorites_models.dart';
import 'package:smartsoil/Feature/favorites/domain/repositories/favorites_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class FavoritesRepoImpl extends FavoritesRepo {
  final FavoriteDataSource favoriteDataSource;

  FavoritesRepoImpl({required this.favoriteDataSource});

  @override
  Future<Either<Failure, AddOrRemoveFavorite>> addOrRemoveFavorite(
      {required int productId, required String userToken}) async {
    try {
      final response = await favoriteDataSource.addOrRemoveFavorite(
        productId: productId,
        userToken: userToken,
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, FavoriteModel>> getFavorites(
      {required String userToken}) async {
    try {
      final response = await favoriteDataSource.getFavorites(
        userToken: userToken,
      );
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
