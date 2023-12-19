import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/helper_view/data/repositories/helper_view.repo.dart';
import 'package:smartsoil/Feature/helper_view/logic/helper_view_states.dart';

class HelperViewCubit extends Cubit<HelperViewState> {
  HelperViewCubit({required this.helperViewRepo}) : super(HelperViewInitial());
  final HelperViewRepo helperViewRepo;

  int currentIndex = 0;

  void changeBottomNavIndex(int index, BuildContext context) {
    helperViewRepo.changeBottomNavIndex(index, context);

    emit(ChangeBottomNavState(index));
  }

  List<Widget> views() {
    return helperViewRepo.views();
  }
}
