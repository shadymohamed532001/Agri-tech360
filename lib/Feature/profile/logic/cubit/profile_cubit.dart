import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/profile/domain/repositories/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());
  final ProfileRepo profileRepo;
  void getProfileData() async {
    {
      final profileEither = await profileRepo.getProfileData();

      profileEither.fold(
        (failure) {
          emit(ProfileErrorState(error: failure.errMessage.toString()));
        },
        (userData) {
          emit(ProfileSuccessState(userData: userData));
        },
      );
    }
  }

  void updateProfileData({
    required String fullName,
    required String city,
    required String phoneNumber,
  }) async {
    {
      emit(UpdateProfileLoadingState());
      final profileEither = await profileRepo.updateProfile(
        city: city,
        fullName: fullName,
        phoneNumber: phoneNumber,
      );

      profileEither.fold(
        (failure) {
          emit(UpdateProfileErrorState(error: failure.errMessage.toString()));
        },
        (userUpdatedData) {
          emit(UpdateProfileSuccessState(userUpdatedModel: userUpdatedData));
          fullNameController.clear();
          cityController.clear();
          phonecontroller.clear();
          getProfileData();
                      isUserDataUpdateShow = false;

    
        },
      );
    }
  }

  bool isUserDataUpdateShow = false;

  bool isUserpasswordShow = false;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
}
