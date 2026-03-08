abstract class Failure {
  final String message;
  final int? statusCode;

  Failure({required this.message, this.statusCode});
}

// Server Failure
class ServerFailure extends Failure {
  ServerFailure(String message) : super(message: message);
}

// Network Failure
class NetworkFailure extends Failure {
  NetworkFailure(String message) : super(message: message);
}

/// Unauthorized Failure (401)
class UnauthorizedFailure extends Failure {
  UnauthorizedFailure(String message, int? statusCode)
    : super(message: message, statusCode: statusCode);
}

// Cache Failure (Local storage error)
class CacheFailure extends Failure {
  CacheFailure(String message) : super(message: message);
}
