import 'package:smartsoil/Feature/search/domain/repositories/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
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
