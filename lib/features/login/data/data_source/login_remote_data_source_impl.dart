import 'package:dio/dio.dart';
import 'package:flutter_architecture_project_use_bloc/core/error/app_exception.dart';
import 'package:flutter_architecture_project_use_bloc/core/network/api_client.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/data/data_source/login_remote_datasource.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/data/models/login_model.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/data/models/login_param.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDatasource {
  final ApiClient apiClient;

  LoginRemoteDataSourceImpl(this.apiClient);

  @override
  Future<LoginModel> login(LoginParam params) async {
    try {
      Response result = await apiClient.dio.post(
        "/auth/login",
        data: {"username": params.username, "password": params.password},
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      print(result.statusCode);

      return LoginModel.fromJson(result.data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizeException("Unauthorize", 401);
      } else if (e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw NetworkException("No Network Connect");
      }
      print("Hello World");
      throw ServerException(
        e.message ?? "Server Error",
        int.parse(e.response!.statusCode.toString()),
      );
    }
  }
}

//"username": "kevinryan", "password": "kev02937@"
