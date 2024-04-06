import 'package:equatable/equatable.dart';
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
}
