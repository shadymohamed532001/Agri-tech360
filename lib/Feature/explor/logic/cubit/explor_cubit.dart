import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/explor/data/models/explor_data_models.dart';
import 'package:smartsoil/Feature/explor/domain/repositories/explor_repo.dart';

part 'explor_state.dart';

class ExplorCubit extends Cubit<ExplorState> {
  ExplorCubit({required this.explorRepo}) : super(ExplorInitial());

  final ExplorRepo explorRepo;
  List<ExplorDataModel> explorData() {
    return explorRepo.getExplorData();
  }
}
