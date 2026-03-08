// Base Exception
abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException({required this.message, this.statusCode});

  @override
  String toString() {
    return "$message $statusCode";
  }
}

// Server exception (404, 500, else)
class ServerException extends AppException {
  ServerException(String message, int statusCode)
    : super(message: message, statusCode: statusCode);
}

// Network Exception (No Internet)
class NetworkException extends AppException {
  NetworkException(String message) : super(message: message);
}

// Cache Local Storage Error
class CacheException extends AppException {
  CacheException(String message, int statusCode)
    : super(message: message, statusCode: statusCode);
}

// Unauthorized Exception
class UnauthorizeException extends AppException {
  UnauthorizeException(String message, int statusCode)
    : super(message: message, statusCode: statusCode);
}
