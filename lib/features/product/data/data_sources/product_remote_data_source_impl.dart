import 'package:dio/dio.dart';
import 'package:flutter_architecture_project_use_bloc/core/error/app_exception.dart';
import 'package:flutter_architecture_project_use_bloc/core/network/api_client.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/data/model/product_model.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiClient apiClient;

  ProductRemoteDataSourceImpl(this.apiClient);
  @override
  Future<List<ProductModel>> getProduct() async {
    try {
      final response = await apiClient.dio.get(
        "/products",
        options: Options(headers: {"Content-Type": "application/json"}),
      );

      return (response.data as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthorizeException("Unauthorized", 401);
      }

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw NetworkException("No Internet Connect");
      }
      throw ServerException(
        e.message ?? "Error Server",
        int.parse(e.response!.statusCode.toString()),
      );
    }
  }
}
