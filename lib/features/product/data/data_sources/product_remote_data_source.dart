import 'package:flutter_architecture_project_use_bloc/features/product/data/model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProduct();
}
