import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/store/data/models/store_product_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class StoreRepo {
  Future<Either<Failure, List<StoreProductModel>>> getStoreData();
}
