part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class ChangeBottomNavState extends HomeState {
  final int index;

  ChangeBottomNavState(this.index);
}

final class GetweatherDataLoadingState extends HomeState {}

final class GetweatherDataErrorState extends HomeState {
  final String errormassage;

  GetweatherDataErrorState({required this.errormassage});
}

final class GetweatherDataSuccessState extends HomeState {
  final List<WeatherModel> weatherModel;

  GetweatherDataSuccessState({required this.weatherModel});
}

final class GetPlantDataLoadingState extends HomeState {}

final class GetPlantDataErrorState extends HomeState {
  final String errormassage;

  GetPlantDataErrorState({required this.errormassage});
}

final class GetPlantDataSuccessState extends HomeState {
  final List<PlantModle> plants;

  GetPlantDataSuccessState({required this.plants});
}

final class HomeNavigtoCheckPlantView extends HomeState {}
