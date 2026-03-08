import 'package:flutter_architecture_project_use_bloc/core/storage/token_storage.dart';
import 'package:flutter_architecture_project_use_bloc/core/storage/token_storage_impl.dart';
import 'package:flutter_architecture_project_use_bloc/features/splash/presentation/controller/splash_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FlutterSecureStorage>(FlutterSecureStorage());
    Get.put<TokenStorage>(TokenStorageImpl(Get.find()));
    Get.put<SplashController>(SplashController(Get.find()));
  }
}
