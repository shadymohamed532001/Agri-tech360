import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/Feature/layout/data/datasources/layout_datasource.dart';
import 'package:smartsoil/Feature/layout/domain/entity/change_index_params.dart';
import 'package:smartsoil/Feature/layout/domain/repositories/layout_repo.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class LayoutRepoImpl extends LayOutRepo {
  final LayoutDataSource layoutDataSource;

  LayoutRepoImpl({required this.layoutDataSource});
  @override
  void changeBottomNavIndex({required ChangeIndexParams changeIndexParams}) {
    layoutDataSource.changeBottomNavIndex(changeIndexParams: changeIndexParams);
  }

  @override
  void changeBottomNavToHome({required ChangeIndexParams changeIndexParams}) {
    layoutDataSource.changeBottomNavToHome(
        changeIndexParams: changeIndexParams);
  }

  @override
  List<Widget> getBody() {
    return layoutDataSource.getBody();
  }

  @override
  List<BottomNavigationBarItem> getBottomNavItems() =>
      layoutDataSource.getBottomNavItems();

  @override
  Future<Either<Failure, List<WeatherModel>>> getWeather() async {
    try {
      String token = await LocalServices.getData(key: 'token');
      Dio dio = Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var response = await dio.get('$baseUrl$weatherendPoint');
      List<WeatherModel> weather = [];

      if (response.statusCode == 200) {
        for (var weatherMap in response.data['data']) {
          weather.add(WeatherModel.fromJson(weatherMap));
        }
        return right(weather);
      } else {
        return left(
            ServerFailure('Non-200 status code: ${response.statusCode}'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<WeatherModel>>> getWeather_2() async {
    try {
      List<WeatherModel> weather = await layoutDataSource.getWeatherData();
      return right(weather);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
