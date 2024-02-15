import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/Feature/layout/domain/entity/change_index_params.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class LayOutRepo {
  void changeBottomNavIndex({required ChangeIndexParams changeIndexParams});

  void changeBottomNavToHome({required ChangeIndexParams changeIndexParams});

  List<Widget> getBody();

  List<BottomNavigationBarItem> getBottomNavItems();

  Future<Either<Failure, List<WeatherModel>>> getWeather();

  Future<Either<Failure, List<WeatherModel>>> getWeather_2();
}
