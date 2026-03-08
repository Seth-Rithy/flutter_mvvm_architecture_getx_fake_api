import 'package:flutter_architecture_project_use_bloc/core/storage/token_param.dart';
import 'package:flutter_architecture_project_use_bloc/core/storage/token_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorageImpl implements TokenStorage {
  final FlutterSecureStorage _storage;

  TokenStorageImpl(this._storage);

  static const String keyToken = "token";

  @override
  Future<bool> checkToken() async {
    String? token = await _storage.read(key: keyToken);
    return token != null && token.isNotEmpty;
  }

  @override
  Future<void> delete() async {
    await _storage.delete(key: keyToken);
  }

  @override
  Future<void> store(TokenParam param) async {
    await _storage.write(key: keyToken, value: param.token);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: keyToken);
  }
}
