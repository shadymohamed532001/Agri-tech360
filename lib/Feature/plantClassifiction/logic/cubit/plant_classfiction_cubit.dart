import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/models/classfiction_model.dart';
import 'package:smartsoil/Feature/plantClassifiction/data/models/product_model.dart';
import 'package:smartsoil/Feature/plantClassifiction/domain/repositories/plant_classfictaion_repo.dart';

part 'plant_classfiction_state.dart';

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

  ClassfictionModel? classfictionModel;
  List<ProductModel> productsInfo = [];

  Future<void> uploadImageToModel({required File image}) async {
    emit(UploadAndGetResponseToModelLoadingState());
    final responsEither =
        await plantCareRepo.getClassficationData(image: image);
    responsEither.fold(
      (failure) {
        emit(UploadAndGetResponseToModelErrorState(
            errorMessage: failure.errMessage.toString()));
      },
      (classificationResponse) {
        classfictionModel = classificationResponse;

        // Iterate over the list of lists of products and save each product into a separate model
        for (var productList in classfictionModel!.products) {
          for (var product in productList) {
            final productModel = ProductModel.fromProduct(product);
            productsInfo.add(productModel);
          }
        }

        print(productsInfo[0].id);
        print(productsInfo[0].images.length);
        print(productsInfo[0].description);

        emit(UploadAndGetResponseToModelSucsesState(
            plantCareModle: classificationResponse));
      },
    );
  }
}
