import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/Feature/home/data/repositories/home_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  final HomeRepo homeRepo;

  int currentIndex = 0;

  Future<void> changeBottomIndex(int index, BuildContext context) async {
    homeRepo.changeBottomNavIndex(index, context);
    emit(ChangeBottomNavState(index));
  }

  List<Widget> views() {
    return homeRepo.views();
  }

  List<Weathermodel> weatherResult = <Weathermodel>[];

  Future<void> saveWeatherDataToLocal(List<Weathermodel> weatherData) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = weatherData.map((weather) => weather.toJson()).toList();
    prefs.setString('weatherData', json.encode(jsonData));
  }

  Future<List<Weathermodel>> loadWeatherDataFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('weatherData');
    if (jsonString != null) {
      final jsonData = json.decode(jsonString);
      return jsonData
          .map<Weathermodel>((weather) => Weathermodel.fromJson(weather))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> getWeather() async {
    emit(HomeGetWeatherLoading());

    try {
      final localWeatherData = await loadWeatherDataFromLocal();

      if (localWeatherData.isNotEmpty) {
        // Use local data
        weatherResult = localWeatherData;
        emit(HomeGetWeatherSuccess(weatherModel: weatherResult));
      } else {
        // Fetch data from the network
        final weatherEither = await homeRepo.getWeather();
        weatherEither.fold(
          (failure) {
            emit(HomeGetWeatherFallure(errormassage: failure.errMessage));
          },
          (weather) async {
            // Save fetched data to local storage
            weatherResult = weather;
            emit(HomeGetWeatherSuccess(weatherModel: weatherResult));
            await saveWeatherDataToLocal(weather);
          },
        );
      }
    } catch (e) {
      print(e.toString());
      emit(HomeGetWeatherFallure(errormassage: e.toString()));
    }
  }

  Future<void> navigateToCheckPlant(BuildContext context) async {
    homeRepo.navigationToPredictPlantView(context: context);
    emit(HomeNavigtoCheckPlantView());
  }
}
