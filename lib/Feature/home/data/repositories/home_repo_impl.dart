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

  // List<Weathermodel> weather = [];

  // @override
  // Future<Either<Failure, List<Weathermodel>>> getWeather() async {
  //   try {
  //     String token = await LocalServices.getData(key: 'token');
  //     Dio dio = Dio();
  //     dio.options.headers = {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     };
  //     var data = await dio.get('$baseUrl$getWeatgerendPoint');

  //     for (var weatherMap in data.data['result']) {
  //       weather.add(Weathermodel.fromJson(weatherMap));
  //     }
  //     return right(weather);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(
  //         ServerFailure.fromDioException(e),
  //       );
  //     }
  //     return left(ServerFailure(e.toString()));
  //   }
  // }

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

      // Fetch data using Dio
      var response = await dio.get('$baseUrl$getWeatgerendPoint');

      // Print Dio response for debugging
      print('Dio Response: $response');

      // Check if the response is successful
      if (response.statusCode == 200) {
        List<Weathermodel> weather = [];

        // Iterate over the data and convert it to Weathermodel objects
        for (var weatherMap in response.data['result']) {
          weather.add(Weathermodel.fromJson(weatherMap));
        }

        // Return the weather data
        return right(weather);
      } else {
        // Handle non-200 status code
        print('Dio Error: Non-200 status code - ${response.statusCode}');
        return left(
            ServerFailure('Non-200 status code: ${response.statusCode}'));
      }
    } catch (e) {
      // Handle Dio exception or other errors
      print('Dio Error: $e');
      if (e is DioError) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
