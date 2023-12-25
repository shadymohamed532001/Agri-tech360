import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/explor/presentation/explor_view.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/Feature/home/data/repositories/home_repo.dart';
import 'package:smartsoil/Feature/home/logic/cubit/home_cubit.dart';
import 'package:smartsoil/Feature/home/presentation/widgets/home_view_body.dart';
import 'package:smartsoil/Feature/profile/presentation/profile_view.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';

class HomeRepooImpl extends HomeRepo {
  @override
  void changeBottomNavIndex(int index, BuildContext context) {
    context.read<HomeCubit>().currentIndex = index;
  }

  @override
  Future<Either<Failure, List<Weathermodel>>> getWeather() async {
    try {
      String token = await LocalServices.getData(key: 'token');
      Dio dio = Dio();
      dio.options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var data = await dio.get('$baseUrl$getWeatgerendPoint');
      var weather = getWeatherList(data.data);
      print(weather);
      return right(weather);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  void navigationToPredictPlantView({required BuildContext context}) {}

  @override
  List<Widget> views() {
    return [
      const HomeViewBody(),
      const ExplorView(),
      const ProfileView(),
      const ProfileView()
    ];
  }
}

List<Weathermodel> getWeatherList(Map<String, dynamic> date) {
  List<Weathermodel> weather = [];

  for (var weatherMap in date['result']) {
    weather.add(Weathermodel.fromJson(weatherMap));
    print(date['result'][0]['date']);
    print(date['result'][0]['icon']);
    print(date['result'][0]['minCelsius']);
  }

  return weather;
}
