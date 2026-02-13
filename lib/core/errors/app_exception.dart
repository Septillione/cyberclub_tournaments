class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, [this.code]);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException(super.message);
}

class ServerException extends AppException {
  ServerException(super.message);
}

class UnknownException extends AppException {
  UnknownException() : super('Произошла неизвестная ошибка');
}
