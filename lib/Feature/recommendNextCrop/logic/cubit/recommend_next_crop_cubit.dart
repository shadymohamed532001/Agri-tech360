import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/recommendNextCrop/data/models/next_crop_model.dart';
import 'package:smartsoil/Feature/recommendNextCrop/domain/repositories/recommend_next_crop_repo.dart';

part 'recommend_next_crop_state.dart';

class RecommendNextCropCubit extends Cubit<RecommendNextCropState> {
  RecommendNextCropCubit({required this.recommendNextCropRepo})
      : super(RecommendNextCropInitial());
  final RecommendNextCropRepo recommendNextCropRepo;

  static RecommendNextCropCubit getObject(context) =>
      BlocProvider.of<RecommendNextCropCubit>(context);
  File? image;
  Future<void> uploadImageFromGalleryModel({required ImagePicker picke}) async {
    try {
      image = await recommendNextCropRepo.pickedImageFromGallary(picke);

      emit(UploadImageFromGallerySucsessState(image: image!));
    } catch (e) {
      emit(UploadImageErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> uploadImageFromCameraModel({required ImagePicker picke}) async {
    try {
      image = await recommendNextCropRepo.pickedImageFromCamira(picke);

      emit(UploadImageFromCameraSucsessState(image: image!));
    } catch (e) {
      emit(UploadImageErrorState(errorMessage: e.toString()));
    }
  }
}
