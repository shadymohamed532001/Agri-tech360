abstract class HelperViewState {}

class HelperViewInitial extends HelperViewState {}

class ChangeBottomNavState extends HelperViewState {
  final int index;

  ChangeBottomNavState(this.index);
}
