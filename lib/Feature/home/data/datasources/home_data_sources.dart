import 'package:smartsoil/Feature/home/data/models/plant_model.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';

abstract class HomeDataSource {
  Future<List<WeatherModel>> getWeatherData();

  Future<List<PlantModle>> getPlantsData();
}
