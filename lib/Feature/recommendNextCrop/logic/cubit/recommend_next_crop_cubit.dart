import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'recommend_next_crop_state.dart';

class RecommendNextCropCubit extends Cubit<RecommendNextCropState> {
  RecommendNextCropCubit() : super(RecommendNextCropInitial());
}
