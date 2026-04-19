import 'package:dio/dio.dart';
import 'package:smartsoil/core/error/app_status_codes.dart';
import 'package:smartsoil/core/error/failuer.dart';

class ServerFailure extends Failure {
  ServerFailure(super.errMessage, {super.type = FailureType.server});

  factory ServerFailure.flutter(String message) =>
      ServerFailure(message, type: FailureType.flutter);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with server',
            type: FailureType.flutter);
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with server',
            type: FailureType.flutter);
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with server',
            type: FailureType.flutter);
      case DioExceptionType.badCertificate:
        return ServerFailure('SSL certificate error, please try again later',
            type: FailureType.flutter);
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request was canceled', type: FailureType.flutter);
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection',
            type: FailureType.flutter);
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected error, please try again',
            type: FailureType.flutter);
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    final fallbackMessage = switch (statusCode) {
      StatusCodes.badRequest => 'badRequest',
      StatusCodes.unAuthorized => 'Unauthorized request',
      StatusCodes.forbidden => 'Forbidden request',
      StatusCodes.notFound => 'Requested resource was not found',
      StatusCodes.conflict => 'Request conflict occurred',
      StatusCodes.internalServerError => 'internalServerError',
      _ => 'Unexpected server error',
    };

    final message = _extractMessage(response);
    return ServerFailure(message ?? fallbackMessage);
  }

  static String? _extractMessage(dynamic response) {
    if (response == null) {
      return null;
    }

    if (response is String) {
      if (_looksLikeHtml(response)) {
        return _extractHtmlTitle(response) ?? 'Internal Server Error';
      }
      return response.isNotEmpty ? response : null;
    }

    if (response is List) {
      for (final item in response) {
        final message = _extractMessage(item);
        if (message != null && message.isNotEmpty) {
          return message;
        }
      }
      return null;
    }

    if (response is Map) {
      const preferredKeys = ['message', 'error', 'errors', 'detail', 'title'];

      for (final key in preferredKeys) {
        final message = _extractMessage(response[key]);
        if (message != null && message.isNotEmpty) {
          return message;
        }
      }

      for (final value in response.values) {
        final message = _extractMessage(value);
        if (message != null && message.isNotEmpty) {
          return message;
        }
      }
    }

    return response.toString();
  }

  static bool _looksLikeHtml(String value) {
    final normalized = value.toLowerCase();
    return normalized.contains('<html') || normalized.contains('<!doctype html');
  }

  static String? _extractHtmlTitle(String value) {
    final match = RegExp(
      r'<title>(.*?)</title>',
      caseSensitive: false,
      dotAll: true,
    ).firstMatch(value);

    final title = match?.group(1)?.trim();
    return (title == null || title.isEmpty) ? null : title;
  }
}
