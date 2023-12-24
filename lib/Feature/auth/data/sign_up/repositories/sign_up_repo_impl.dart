import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class SignUpRepoImpl extends SignUpRepo {
  @override
  Future<Either<Failure, AuthModel>> signUpUser({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
    required String city,
  }) async {
    try {
      var response =
          await ApiServices.postData(endpoint: registerendPoint, data: {
        'fullName': fullName,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'city': city
      });
      final AuthModel user = AuthModel.fromJson(response.data);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
