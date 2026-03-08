import 'package:dio/dio.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "https://fakestoreapi.com/",
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
      ),
    );
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          print("❌ ERROR ${error.message}");
          return handler.next(error);
        },
        onRequest: (options, handler) {
          print("➡ REQUEST ${options.method} ${options.path}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("✅ RESPONSE ${response.statusCode}");
          return handler.next(response);
        },
      ),
    );
  }

  // Singleton
  static final ApiClient _instand = ApiClient._internal();

  factory ApiClient() => _instand;

  Dio get dio {
    return _dio;
  }
}
