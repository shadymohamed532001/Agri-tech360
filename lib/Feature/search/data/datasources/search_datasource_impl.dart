import 'package:smartsoil/Feature/search/data/datasources/search_datasource.dart';

class SearchDatasourceImpl implements SearchDatasource {
  @override
  Future<List> searchPlant({required String plantName}) {
    throw UnimplementedError();
  }

  // @override
  // Future<List<dynamic>> searchHotels({
  //   required String hotelName,
  // }) async {
  //   final response = await apiConsumer.get(
  //     '${EndPoints.hotelSearch}$hotelName',
  //     queryParameters: {'name': hotelName},
  //   );

  //   return response;
  // }
}
