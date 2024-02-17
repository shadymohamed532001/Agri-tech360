import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/home/data/models/plant_model.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/Feature/home/domain/repositories/home_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());

  static HomeCubit getObject(context) => BlocProvider.of<HomeCubit>(context);

  final HomeRepo homeRepo;

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

  Future<void> getWeather() async {
    emit(GetweatherDataLoadingState());

    try {
      final localWeatherData = await loadWeatherDataFromLocal();

      if (localWeatherData.isNotEmpty) {
        weatherResult = localWeatherData;
        emit(GetweatherDataSuccessState(weatherModel: weatherResult));
      } else {
        final weatherEither = await homeRepo.getWeather();
        weatherEither.fold(
          (failure) {
            emit(GetweatherDataErrorState(errormassage: failure.errMessage));
          },
          (weather) async {
            weatherResult = weather;
            emit(GetweatherDataSuccessState(weatherModel: weatherResult));
            await saveWeatherDataToLocal(weather);
          },
        );
      }
    } catch (e) {
      emit(GetweatherDataErrorState(errormassage: e.toString()));
    }
  }

  List<PlantModle> plantsresult = <PlantModle>[];

  Future<void> savePlantDataToLocal(List<PlantModle> plants) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = plants.map((plant) => plant.toJson()).toList();
    prefs.setString('plantsData', json.encode(jsonData));
  }

  Future<List<PlantModle>> loadPlantsDataFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('plantsData');
    if (jsonString != null) {
      final jsonData = json.decode(jsonString);
      return jsonData
          .map<PlantModle>((plant) => PlantModle.fromJson(plant))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> getPlants() async {
    emit(GetPlantDataLoadingState());
    try {
      final localPlantData = await loadPlantsDataFromLocal();

      if (localPlantData.isNotEmpty) {
        plantsresult = localPlantData;
        emit(GetPlantDataSuccessState(plants: plantsresult));
      } else {
        final plantEither = await homeRepo.getPlantsData();
        plantEither.fold(
          (failure) {
            emit(GetPlantDataErrorState(errormassage: failure.errMessage));
          },
          (plant) async {
            plantsresult = plant;
            emit(GetPlantDataSuccessState(plants: plantsresult));
            await savePlantDataToLocal(plant);
          },
        );
      }
    } catch (e) {
      emit(GetweatherDataErrorState(errormassage: e.toString()));
    }
  }
}
