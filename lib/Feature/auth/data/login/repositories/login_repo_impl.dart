import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:smartsoil/Feature/auth/data/login/models/user_model.dart';
import 'package:smartsoil/Feature/auth/data/login/repositories/login_repo.dart';
import 'package:smartsoil/core/api/api_services.dart';
import 'package:smartsoil/core/api/end_boint.dart';
import 'package:smartsoil/core/error/failuer.dart';
import 'package:smartsoil/core/error/servier_failure.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<Either<Failure, BagAuthModel>> loginUser({
    required String email,
    required String password,
    String? lang,
  }) async {
    try {
      var response = await ApiServices.postData(endpoint: loginendpoint, data: {
        'email': email,
        'password': password,
      });
      final BagAuthModel user = BagAuthModel.fromJson(response.data);
      print(user);
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
