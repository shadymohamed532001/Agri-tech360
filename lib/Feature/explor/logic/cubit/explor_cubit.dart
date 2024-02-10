import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_data_models.dart';
import 'package:smartsoil/Feature/explor/domain/repositories/explor_repo.dart';
import 'package:smartsoil/core/helper/helper_const.dart';

part 'explor_state.dart';

class ExplorCubit extends Cubit<ExplorState> {
  ExplorCubit({required this.explorRepo}) : super(ExplorInitial());

  int? indexOfExploration;
  int? x;

  final ExplorRepo explorRepo;
  List<ExplorDataModel> explorData() {
    explorationData = explorRepo.getExplorData();
    return explorRepo.getExplorData();
  }

  void setIndex(int index) {}
}
