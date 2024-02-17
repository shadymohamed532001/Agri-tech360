import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'plant_classfiction_state.dart';

class PlantClassfictionCubit extends Cubit<PlantClassfictionState> {
  PlantClassfictionCubit() : super(PlantClassfictionInitial());
}
