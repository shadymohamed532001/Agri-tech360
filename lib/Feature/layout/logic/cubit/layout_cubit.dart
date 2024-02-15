import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/Feature/layout/domain/entity/change_index_params.dart';
import 'package:smartsoil/Feature/layout/domain/repositories/layout_repo.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit({required this.layOutRepo}) : super(LayoutInitial());

  final LayOutRepo layOutRepo;

  static LayoutCubit getObject(context) =>
      BlocProvider.of<LayoutCubit>(context);

  int currentIndex = 0;

  List<Widget> getBody() {
    return layOutRepo.getBody();
  }

  List<BottomNavigationBarItem> getBottomNavItems() =>
      layOutRepo.getBottomNavItems();

  void changeBottomNavIndex(int index, BuildContext context) {
    currentIndex = index;

    layOutRepo.changeBottomNavIndex(
      changeIndexParams: ChangeIndexParams(
        context: context,
        index: index,
      ),
    );

    if (currentIndex == 0) {
      getWeather();
    }
    //  When Navigation to favorites scarean

    // if (currentIndex == 2) {
    //   BlocProvider.of<FavoriteCubit>(context).getFavorites();
    // }

    emit(ChangeBottomNavState(index: index));
  }

  void changeBottomNavToHome(BuildContext context) {
    layOutRepo.changeBottomNavToHome(
        changeIndexParams: ChangeIndexParams(context: context));

    emit(const ChangeBottomNavToHome());
  }

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
        final weatherEither = await layOutRepo.getWeather();
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
}
