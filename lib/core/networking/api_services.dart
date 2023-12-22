import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:smartsoil/core/networking/end_boint.dart';

class ApiServices {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String endpoint,
    required Object? data,
    String? token,
    String lang = 'ar',
  }) async {
    dio?.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
      'lang': lang,
    };
    return await dio!.post(
      endpoint,
      data: data,
    );
  }

  static Future<Map<String, dynamic>> getData({
    required String endpoint,
    Map<String, String>? data,
    String? token,
    String? lang,
    Map<String, dynamic>? queryParameters,
  }) async {
    dio?.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
      'lang': lang ?? 'en',
    };

    Response? response = await dio?.get(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
    return jsonDecode(response?.data);
  }

  // static Future<dynamic> getData({
  //   required String endpoint,
  //   Object? data,
  //   String? token,
  //   String lang = 'ar',
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   dio?.options.headers = {
  //     'Authorization': token,
  //     'Content-Type': 'application/json',
  //     'lang': lang,
  //   };
  //   return await dio!.get(
  //     endpoint,
  //     queryParameters: queryParameters,
  //   );
  // }
}
