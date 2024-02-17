import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/home/data/models/plant_model.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<WeatherModel>>> getWeather();

// Returns the list of ExplorModel models
  Future<Either<Failure, List<PlantModle>>> getPlantsData();
}
