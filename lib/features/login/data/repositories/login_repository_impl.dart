import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_project_use_bloc/core/error/app_exception.dart';
import 'package:flutter_architecture_project_use_bloc/core/error/failure.dart';
import 'package:flutter_architecture_project_use_bloc/core/storage/token_param.dart';
import 'package:flutter_architecture_project_use_bloc/core/storage/token_storage.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/data/data_source/login_remote_datasource.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/data/models/login_param.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/domain/entities/login_entity.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDatasource loginRemoteDatasource;
  final TokenStorage tokenStorage;
  LoginRepositoryImpl(this.loginRemoteDatasource, {required this.tokenStorage});

  @override
  Future<Either<Failure, LoginEntity>> login(LoginParam params) async {
    try {
      final result = await loginRemoteDatasource.login(params);
      // Storage token to secure
      await tokenStorage.store(TokenParam(token: result.token));
      return Right(result);
    } on UnauthorizeException catch (e) {
      return Left(UnauthorizedFailure(e.message, e.statusCode));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    }
  }
}
