part of 'layout_cubit.dart';

sealed class LayoutState extends Equatable {
  const LayoutState();

  @override
  List<Object> get props => [];
}

final class LayoutInitial extends LayoutState {}

class ChangeBottomNavState extends LayoutState {
  final int index;

  const ChangeBottomNavState({required this.index});

  @override
  List<Object> get props => [index];
}

class ChangeBottomNavToHome extends LayoutState {
  const ChangeBottomNavToHome();
}

final class HomeGetWeatherLoading extends LayoutState {}

final class HomeGetWeatherFallure extends LayoutState {
  final String errormassage;

  const HomeGetWeatherFallure({required this.errormassage});
}

final class HomeGetWeatherSuccess extends LayoutState {
  final List<WeatherModel> weatherModel;

  const HomeGetWeatherSuccess({required this.weatherModel});
}
