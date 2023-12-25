part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class ChangeBottomNavState extends HomeState {
  final int index;

  ChangeBottomNavState(this.index);
}

final class HomeGetWeatherLoading extends HomeState {}

final class HomeGetWeatherFallure extends HomeState {
  final String errormassage;

  HomeGetWeatherFallure({required this.errormassage});
}

final class HomeGetWeatherSuccess extends HomeState {
  final List<Weathermodel> weatherModel;

  HomeGetWeatherSuccess({required this.weatherModel});
}
