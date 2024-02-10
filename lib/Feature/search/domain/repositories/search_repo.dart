import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_data_models.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ExplorDataModel>>> searchPlants({
    required String plantName,
  });
}
