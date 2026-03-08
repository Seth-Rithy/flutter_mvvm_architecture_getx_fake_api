import 'package:flutter_architecture_project_use_bloc/core/storage/token_param.dart';

abstract class TokenStorage {
  // for store token
  Future<void> store(TokenParam token);

  // for delete token or logout
  Future<void> delete();

  // check token have store or not
  Future<bool> checkToken();

  // for request data from server (return String)
  Future<String?> getToken();
}
