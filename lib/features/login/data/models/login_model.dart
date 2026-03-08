import 'package:flutter_architecture_project_use_bloc/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {"token": token};
  }
}
