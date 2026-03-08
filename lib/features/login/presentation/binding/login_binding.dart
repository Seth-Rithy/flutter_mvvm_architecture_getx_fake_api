import 'package:flutter_architecture_project_use_bloc/core/network/api_client.dart';
import 'package:flutter_architecture_project_use_bloc/core/storage/token_storage.dart';
import 'package:flutter_architecture_project_use_bloc/core/storage/token_storage_impl.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/data/data_source/login_remote_data_source_impl.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/data/data_source/login_remote_datasource.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/domain/repositories/login_repository.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/domain/usecase/login_use_case.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/presentation/controller/login_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());

    Get.lazyPut<LoginRemoteDatasource>(
      () => LoginRemoteDataSourceImpl(Get.find()),
    );

    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(Get.find(), tokenStorage: Get.find()),
    );

    Get.lazyPut(() => LoginUseCase(Get.find()));

    Get.lazyPut<TokenStorage>(() => TokenStorageImpl(Get.find()));

    Get.lazyPut(() => FlutterSecureStorage());

    Get.lazyPut(() => LoginController(loginUseCase: Get.find()));
  }
}

