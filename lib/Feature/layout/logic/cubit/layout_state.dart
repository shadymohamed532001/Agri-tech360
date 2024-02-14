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

class GetUserDataLoadingState extends LayoutState {
  const GetUserDataLoadingState();
}

// class GetUserDataSuccessState extends LayoutState {
//   // final HomeModel homeModel;

//   const GetUserDataSuccessState({required this.homeModel});

//   @override
//   List<Object> get props => [homeModel];
// }

class GetUserDataErrorState extends LayoutState {
  final String error;

  const GetUserDataErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
