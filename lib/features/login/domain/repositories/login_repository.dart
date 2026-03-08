import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_project_use_bloc/core/error/failure.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/data/models/login_param.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/domain/entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login(LoginParam params);
}
