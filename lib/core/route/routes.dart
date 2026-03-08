import 'package:flutter_architecture_project_use_bloc/core/route/routes_name.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/presentation/binding/login_binding.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/presentation/page/login_page.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/presentation/binding/product_binding.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/presentation/pages/detail_page.dart';
import 'package:flutter_architecture_project_use_bloc/features/product/presentation/pages/product_page.dart';
import 'package:flutter_architecture_project_use_bloc/features/splash/presentation/binding/splash_binding.dart';
import 'package:flutter_architecture_project_use_bloc/features/splash/presentation/page/splash_page.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage> routes = [
    GetPage(
      name: RoutesName.productPage,
      page: () => ProductPage(),
      binding: ProductBinding(),
    ),
    GetPage(name: RoutesName.detailPage, page: () => DetailPage()),

    GetPage(
      name: RoutesName.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: RoutesName.splashPage,
      page: () => SplashPage(),
      binding: SplashBinding(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 500),
    ),
  ];
}
