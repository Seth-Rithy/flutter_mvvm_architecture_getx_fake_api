import 'package:flutter/material.dart';
import 'package:flutter_architecture_project_use_bloc/core/route/routes.dart';
import 'package:flutter_architecture_project_use_bloc/core/route/routes_name.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: RoutesName.splashPage,
      getPages: Routes.routes,
    );
  }
}
