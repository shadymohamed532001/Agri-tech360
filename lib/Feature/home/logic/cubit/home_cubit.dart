import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/home/data/models/weather_model.dart';
import 'package:smartsoil/Feature/home/data/repositories/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  final HomeRepo homeRepo;

  int currentIndex = 0;

  void changeBottomIndex(int index, BuildContext context) {
    homeRepo.changeBottomNavIndex(index, context);
    emit(ChangeBottomNavState(index));
  }

  List<Widget> views() {
    return homeRepo.views();
  }

  List<Weathermodel> weatherResult = <Weathermodel>[];
  Future<void> getWeather() async {
    emit(HomeGetWeatherLoading());

    try {
      final weatherEither = await homeRepo.getWeather();
      weatherEither.fold(
        (failure) {
          emit(HomeGetWeatherFallure(errormassage: failure.errMessage));
        },
        (weather) {
          weatherResult = weather;
          emit(HomeGetWeatherSuccess(weatherModel: weatherResult));
        },
      );
    } catch (e) {
      emit(HomeGetWeatherFallure(errormassage: e.toString()));
    }
  }

  // Future<Weathermodel?> fetchData() async {
  //   emit(HomeGetWeatherLoading());

  //   try {
  //     String token = await LocalServices.getData(key: 'token');
  //     Dio dio = Dio();
  //     dio.options.headers = {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     };

  //     final response = await dio.get('$baseUrl$getWeatgerendPoint');
  //     Map<String, dynamic> data = response.data;
  //     weatherResult = Weathermodel.fromJson(data);
  //     HomeGetWeatherSuccess(weatherModel: weatherResult!);
  //     return weatherResult;
  //   } catch (error) {
  //     emit(HomeGetWeatherFallure(errormassage: error.toString()));
  //   }
  //   return null;
  // }
}
