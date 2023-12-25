import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Weathermodel>>> getWeather();

  void navigationToPredictPlantView({required BuildContext context});

  void changeBottomNavIndex(int index, BuildContext context);

  List<Widget> views();
}
