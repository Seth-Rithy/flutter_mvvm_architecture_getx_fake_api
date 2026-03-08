import 'dart:async';
import 'package:flutter_architecture_project_use_bloc/core/route/routes_name.dart';
import 'package:flutter_architecture_project_use_bloc/core/storage/token_storage.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final TokenStorage tokenStorage;

  SplashController(this.tokenStorage);

  @override
  void onInit() {
    super.onInit();
    splashCheck();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  //   splashCheck();
  // }

  Future<void> splashCheck() async {
    final hasToken = await tokenStorage.checkToken();

    await Future.delayed(const Duration(seconds: 3));

    if (hasToken) {
      Get.offNamed(RoutesName.productPage);
    } else {
      Get.offNamed(RoutesName.loginPage);
    }
  }
}
