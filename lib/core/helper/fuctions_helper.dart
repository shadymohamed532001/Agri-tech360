import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/networking/local_services.dart';

Future<Map<String, dynamic>> fetchDataFromLocalStorage() async {
  onBording = await LocalServices.getData(key: 'onbording');
  token = await LocalServices.getData(key: 'token');
  // You can return the values as a Map or use a custom class to represent the result
  return {'onBording': onBording, 'token': token};
}
