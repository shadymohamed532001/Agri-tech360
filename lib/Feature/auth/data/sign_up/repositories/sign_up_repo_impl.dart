import 'dart:io';

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
  Future<Either<Failure, UserModel>> signUpUser({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
    required String city,
    File? profilePic,
  }) async {
    try {
      var response = await _registerRequest(
        email: email,
        password: password,
        fullName: fullName,
        phoneNumber: phoneNumber,
        city: city,
        profilePic: profilePic,
        includeProfilePic: profilePic != null,
      );

      final UserModel user = UserModel.fromJson(response);
      return right(user);
    } on DioException catch (e) {
      // The current backend returns HTTP 500 whenever profilePic is sent.
      // Retry once without the image so registration can still complete.
      if (_shouldRetryWithoutProfilePic(e)) {
        try {
          final response = await _registerRequest(
            email: email,
            password: password,
            fullName: fullName,
            phoneNumber: phoneNumber,
            city: city,
            profilePic: null,
            includeProfilePic: false,
          );

          final UserModel user = UserModel.fromJson(response);
          return right(user);
        } on DioException catch (retryException) {
          return Left(ServerFailure.fromDioException(retryException));
        } catch (retryException) {
          return Left(ServerFailure(retryException.toString()));
        }
      }

      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Map<String, dynamic>> _registerRequest({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String city,
    required File? profilePic,
    required bool includeProfilePic,
  }) async {
    final formMap = <String, dynamic>{
      'email': email,
      'password': password,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'city': city,
    };

    if (includeProfilePic && profilePic != null) {
      formMap['profilePic'] = await MultipartFile.fromFile(
        profilePic.path,
        filename: profilePic.path.split('/').last,
      );
    }

    final formData = FormData.fromMap(formMap);

    return ApiServices.postFormData(
      endpoint: registerendPoint,
      formData: formData,
    );
  }

  bool _shouldRetryWithoutProfilePic(DioException exception) {
    return exception.type == DioExceptionType.badResponse &&
        exception.response?.statusCode == 500;
  }
}
