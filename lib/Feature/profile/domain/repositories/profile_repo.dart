import 'package:dartz/dartz.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/core/error/failuer.dart';

abstract class ProfileRepo {
  // Future<void> logOut();
Future<Either<Failure, UserModel>> getProfileData();

}
