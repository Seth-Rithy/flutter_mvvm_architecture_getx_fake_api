import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_project_use_bloc/core/error/failure.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProduct();
}
