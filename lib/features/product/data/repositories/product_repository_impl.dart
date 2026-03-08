import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_project_use_bloc/core/error/app_exception.dart';
import 'package:flutter_architecture_project_use_bloc/core/error/failure.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/data/model/product_model.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/domain/entities/product_entity.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepositoryImpl(this.productRemoteDataSource);

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
    try {
      List<ProductModel> result = await productRemoteDataSource.getProduct();
      return Right(result);
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on UnauthorizeException catch (e) {
      return Left(UnauthorizedFailure(e.message, e.statusCode));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
