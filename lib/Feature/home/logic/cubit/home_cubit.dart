import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
}
