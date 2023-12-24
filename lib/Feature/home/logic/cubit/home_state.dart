part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class ChangeBottomNavState extends HomeState {
  final int index;

  ChangeBottomNavState(this.index);
}
