import 'package:flutter/material.dart';
import 'package:flutter_architecture_project_use_bloc/core/route/routes_name.dart';
import 'package:flutter_architecture_project_use_bloc/core/util/usecase/params.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/data/models/login_param.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/domain/usecase/login_use_case.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;
  LoginController({required this.loginUseCase});

  var keyForm = GlobalKey<FormState>().obs;
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  RxBool obs = true.obs;

  final RxnInt statusCode = RxnInt();

  String? usernameValid(String? value) {
    if (value!.isEmpty) {
      return "Username is not empty!";
    }

    if (statusCode.value != null) {
      return "Check your username again!";
    }

    return null;
  }

  String? passwordValid(String? value) {
    if (value!.isEmpty) {
      return "Username is not empty!";
    }

    if (statusCode.value != null) {
      return "Check your password again!";
    }
    return null;
  }

  Future<void> obsSecure() async {
    obs.value = !obs.value;
  }

  // "username": "kevinryan", "password": "kev02937@"
  Future<void> signIn() async {
    try {
      // if (keyForm.value.currentState!.validate()) {
      final result = await loginUseCase.call(
        Params(
          LoginParam(
            username: "kevinryan",
            password: "kev02937@",
            // password: passwordController.value.text.trim(),
            // username: usernameController.value.text.trim(),
          ),
        ),
      );

      result.fold(
        (failure) {
          Get.snackbar("Error", "Sign In Error");
          statusCode.value = failure.statusCode;
        },
        (token) {
          print(token.token);
          Get.offNamed(RoutesName.productPage);
          Get.snackbar("Success", "Sign In Success");
        },
      );
      // }
    } catch (e) {
      print(e);
    }
  }
}
