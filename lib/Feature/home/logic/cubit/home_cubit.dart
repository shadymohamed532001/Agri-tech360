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

  int currentIndex = 1;

  // Future<void> changeBottomIndex(int index, BuildContext context) async {
  //   homeRepo.changeBottomNavIndex(index, context);
  //   emit(ChangeBottomNavState(index));
  // }

  List<WeatherModel> weatherResult = <WeatherModel>[];

  Future<void> saveWeatherDataToLocal(List<WeatherModel> weatherData) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = weatherData.map((weather) => weather.toJson()).toList();
    prefs.setString('weatherData', json.encode(jsonData));
  }

  Future<List<WeatherModel>> loadWeatherDataFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('weatherData');
    if (jsonString != null) {
      final jsonData = json.decode(jsonString);
      return jsonData
          .map<WeatherModel>((weather) => WeatherModel.fromJson(weather))
          .toList();
    } else {
      return [];
    }
  }

  // Future<void> navigateToCheckPlant(BuildContext context) async {
  //   homeRepo.navigationToPredictPlantView(context: context);
  //   emit(HomeNavigtoCheckPlantView());
  // }
}
