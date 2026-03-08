import 'package:flutter_architecture_project_use_bloc/core/network/api_client.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/data/data_sources/product_remote_data_source.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/data/data_sources/product_remote_data_source_impl.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/data/repositories/product_repository_impl.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/domain/repositories/product_repository.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/domain/usecases/product_list.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/presentation/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient(), fenix: true);

    Get.lazyPut<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(Get.find()),
      fenix: true,
    );

    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(Get.find()),
      fenix: true,
    );

    Get.lazyPut(() => ProductList(Get.find()), fenix: true);

    Get.lazyPut(() => ProductController(productList: Get.find()), fenix: true);
  }
}
