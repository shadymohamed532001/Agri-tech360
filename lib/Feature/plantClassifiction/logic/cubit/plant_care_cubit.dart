import 'dart:developer';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/models/plant_classfiction_model.dart';
import 'package:smartsoil/Feature/plantClassifiction/domain/repositories/plant_care_repo.dart';

part 'plant_care_state.dart';

class PlantCareCubite extends Cubit<PlantCareState> {
  PlantCareCubite({required this.plantCareRepo})
      : super(PlantClassfictionInitial());

  final PlantCareRepo plantCareRepo;

  static PlantCareCubite getObject(context) =>
      BlocProvider.of<PlantCareCubite>(context);
  File? image;

  Future<void> uploadImageFromGalleryModel({required ImagePicker picke}) async {
    try {
      image = await plantCareRepo.pickedImageFromGallary(picke);

      emit(UploadImageFromGallerySucsessState(image: image!));
    } catch (e) {
      emit(UploadImageErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> uploadImageFromCameraModel({required ImagePicker picke}) async {
    try {
      image = await plantCareRepo.pickedImageFromCamira(picke);

      emit(UploadImageFromCameraSucsessState(image: image!));
    } catch (e) {
      emit(UploadImageErrorState(errorMessage: e.toString()));
    }
  }

  PlantCareModle? plantCareModle;

  Future<void> uploadImageToModel({required File image}) async {
    emit(UploadAndGetResponseToModelLoadingState());
    final responsEither =
        await plantCareRepo.getClassficationData(image: image);
    responsEither.fold((failure) {
      log(failure.errMessage.toString());

      emit(
        UploadAndGetResponseToModelErrorState(
          errorMessage: failure.errMessage.toString(),
        ),
      );

      log(failure.errMessage.toString());
    }, (calssficationResponse) {
      plantCareModle = calssficationResponse;
      print(plantCareModle!.data.predictions);
      print(plantCareModle!.data.confidence);

      emit(
        UploadAndGetResponseToModelSucsesState(
          plantCareModle: calssficationResponse,
        ),
      );
    });
  }
}
