import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';

abstract class ProfileDataSources {
  Future<UserModel> getUserData();
  Future<UserModel> updateProfile({
    required String fullName,
    required String city,
    required String phoneNumber,
  });
}
