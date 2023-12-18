import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/auth/data/sign_up/repositories/sign_up_repo.dart';
import 'package:smartsoil/core/api/api_services.dart';
import 'package:smartsoil/core/api/end_boint.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class SignUpRepoImpl extends SignUpRepo {
  @override
  Future<Either<Failure, BagAuthModel>> signUpUser({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      var response = await ApiServices.postData(
          endpoint: registerendPoint,
          data: {
            'name': name,
            'email': email,
            'password': password,
            'phone': phone
          });
      final BagAuthModel user = BagAuthModel.fromJson(response.data);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(ServerFailure(e.toString()));
    }
  }
}