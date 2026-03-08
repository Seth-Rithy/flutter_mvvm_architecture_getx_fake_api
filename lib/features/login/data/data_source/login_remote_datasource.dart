import 'package:flutter_architecture_project_use_bloc/features/login/data/models/login_model.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/data/models/login_param.dart';

abstract class LoginRemoteDatasource {
  Future<LoginModel> login(LoginParam param);
}
