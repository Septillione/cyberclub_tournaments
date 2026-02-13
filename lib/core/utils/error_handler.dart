import 'package:cyberclub_tournaments/core/errors/app_exception.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  static AppException handle(Object error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return NetworkException(
            'Время ожидания истекло. Проверьте интернет.',
          );

        case DioExceptionType.connectionError:
          return NetworkException("Нет соединения с сервером.");

        case DioExceptionType.badResponse:
          return _handleBadResponse(error.response);

        case DioExceptionType.cancel:
          return AppException('Запрос был отменен.');

        default:
          return NetworkException('Ошибка сети. Попробуйте позже.');
      }
    } else if (error is AppException) {
      return error;
    } else {
      return UnknownException();
    }
  }

  static ServerException _handleBadResponse(Response? response) {
    if (response == null) return ServerException('Неизвестная ошибка сервера');

    try {
      final data = response.data;

      if (data is Map<String, dynamic> && data.containsKey('message')) {
        final message = data['message'];

        if (message is List) {
          return ServerException(message.join('\n'));
        }

        return ServerException(message.toString());
      }

      if (response.statusCode == 404) {
        return ServerException('Ресурс не найден (404)');
      }

      if (response.statusCode == 500) {
        return ServerException("Внутренняя ошибка сервера (500)");
      }
    } catch (e) {
      return ServerException('Ошибка обработки ответа сервера');
    }

    return ServerException('Ошибка сервера: ${response.statusCode}');
  }
}
