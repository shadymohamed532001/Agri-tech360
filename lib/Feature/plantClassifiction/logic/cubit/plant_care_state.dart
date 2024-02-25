part of 'plant_care_cubit.dart';

sealed class PlantCareState extends Equatable {
  const PlantCareState();

  @override
  List<Object> get props => [];
}

final class PlantClassfictionInitial extends PlantCareState {}

final class UploadImageFromGallerySucsessState extends PlantCareState {
  final File image;

  const UploadImageFromGallerySucsessState({required this.image});
}

final class UploadImageErrorState extends PlantCareState {
  final String errorMessage;

  const UploadImageErrorState({required this.errorMessage});
}

final class UploadImageFromCameraSucsessState extends PlantCareState {
  final File image;

  const UploadImageFromCameraSucsessState({required this.image});
}

final class UploadAndGetResponseToModelSucsesState extends PlantCareState {
  final ClassfictionModel plantCareModle;

  const UploadAndGetResponseToModelSucsesState({required this.plantCareModle});
}

final class UploadAndGetResponseToModelLoadingState extends PlantCareState {}

final class UploadAndGetResponseToModelErrorState extends PlantCareState {
  final String errorMessage;

  const UploadAndGetResponseToModelErrorState({required this.errorMessage});
}
