import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_data_models.dart';
import 'package:smartsoil/Feature/search/domain/repositories/search_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';

class SearchRepoImpl implements SearchRepo {
  @override
  Future<Either<Failure, List<ExplorDataModel>>> searchPlants({
    required String plantName,
  }) {
    // TODO: implement searchPlants
    throw UnimplementedError();
  }

  // Future<Either<Failure, List<Hotel>>> searchHotels({
  //   required String hotelName,
  // }) async {

  //     try {
  //       final response =
  //           await searchDatasource.searchHotels(hotelName: hotelName);

  //       List<Hotel> hotels = <Hotel>[];

  //       for (Map<String, dynamic> hotel in response) {
  //         hotels.add(Hotel.fromJson(hotel));
  //       }

  //       return Right(hotels);
  //     } catch (e) {
  //       if (e is DioException) {
  //         return Left(ServerFailure.fromDioException(e));
  //       }
  //       return Left(ServerFailure(failureMsg: e.toString()));
  //     }
  //   } else {
  //     return Left(ServerFailure(failureMsg: AppStrings.noInternet));
  //
  // }
}
