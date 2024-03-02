import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
}
