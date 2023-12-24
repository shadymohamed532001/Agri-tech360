import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:smartsoil/core/networking/end_boint.dart';

class ApiServices {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData({
    required String endpoint,
    required Object? data,
    String? token,
  }) async {
    dio?.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
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
    Map<String, dynamic>? queryParameters,
  }) async {
    dio?.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    Response? response = await dio?.get(
      endpoint,
      queryParameters: queryParameters,
      data: data,
    );
    return jsonDecode(response?.data);
  }
}
