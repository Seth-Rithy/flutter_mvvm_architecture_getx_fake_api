import 'package:flutter_architecture_project_use_bloc/core/util/usecase/no_params.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/domain/entities/product_entity.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/domain/usecases/product_list.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final ProductList productList;

  ProductController({required this.productList});

  RxList<ProductEntity> listAllProduct = <ProductEntity>[].obs;
  RxList<ProductEntity> tmpListProduct = <ProductEntity>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (listAllProduct.isEmpty) {
      getListProduct();
    }
  }

  Future<void> getListProduct() async {
    try {
      final result = await productList.call(NoParams());
      result.fold(
        (failure) {
          Get.snackbar("Error", failure.message);
        },
        (product) {
          listAllProduct.assignAll(product);
          tmpListProduct.value = List.from(product);
        },
      );
    } catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    }
  }
}
