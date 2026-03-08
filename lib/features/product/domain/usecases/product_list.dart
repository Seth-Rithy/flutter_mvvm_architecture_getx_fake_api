import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_project_use_bloc/core/error/failure.dart';
import 'package:flutter_architecture_project_use_bloc/core/util/usecase/no_params.dart';
import 'package:flutter_architecture_project_use_bloc/core/util/usecase/use_case.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/domain/entities/product_entity.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/domain/repositories/product_repository.dart';

class ProductList implements UseCase<List<ProductEntity>, NoParams> {
  final ProductRepository productRepository;
  ProductList(this.productRepository);

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) async {
    return await productRepository.getProduct();
  }
}
