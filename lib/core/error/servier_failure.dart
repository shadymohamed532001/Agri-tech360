import 'package:dio/dio.dart';
import 'package:smartsoil/core/error/app_status_codes.dart';
import 'package:smartsoil/core/error/failuer.dart';

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Your request not found, please try again later!');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(
          "Unexpected Error, please try again!",
        );
      default:
        return ServerFailure('ppStrings.opp');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    final parsedResponse = response;

    if (parsedResponse != null && parsedResponse is Map<String, dynamic>) {
      if (statusCode == StatusCodes.badRequest ||
          statusCode == StatusCodes.unAuthorized ||
          statusCode == StatusCodes.forbidden) {
        return ServerFailure(parsedResponse['msgError'] ?? 'AppStrings.opps');
      } else if (statusCode == StatusCodes.internalServerError) {
        return ServerFailure(parsedResponse['error'] ?? 'AppStrings.opp');
      }
    }

    return ServerFailure('AppStrings.opp');
  }
}
