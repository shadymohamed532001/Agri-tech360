import 'package:smartsoil/core/helper/helper_const.dart';
import 'package:smartsoil/core/networking/local_services.dart';

Future<Map<String, dynamic>> fetchDataFromLocalStorage() async {
  onBording = await LocalServices.getData(key: 'onbording');
  usertoken = await LocalServices.getData(key: 'token');
  return {'onBording': onBording, 'token': usertoken};
}
