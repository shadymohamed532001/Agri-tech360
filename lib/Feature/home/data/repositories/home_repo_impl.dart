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
import 'package:smartsoil/core/helper/extentaions.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/networking/local_services.dart';
import 'package:smartsoil/core/routing/routes.dart';

class HomeRepooImpl extends HomeRepo {
  @override
  void changeBottomNavIndex(int index, BuildContext context) {
    context.read<HomeCubit>().currentIndex = index;
  }

  @override
  void navigationToPredictPlantView({required BuildContext context}) {
    context.pushName(Routes.checkPlantViewRoute);
  }

  @override
  List<Widget> views() {
    return [
      const ExplorView(),
      const HomeViewBody(),
      const ProfileView(),
    ];
  }

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
}
