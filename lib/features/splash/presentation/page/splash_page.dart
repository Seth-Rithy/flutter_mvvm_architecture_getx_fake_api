import 'package:flutter/material.dart';
import 'package:flutter_architecture_project_use_bloc/features/splash/presentation/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Image.asset("assets/images/logo.png", width: 64, height: 64),
      ),
    );
  }
}
