import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_project_use_bloc/core/error/failure.dart';
import 'package:flutter_architecture_project_use_bloc/core/util/usecase/params.dart';
import 'package:flutter_architecture_project_use_bloc/core/util/usecase/use_case.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/data/models/login_param.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/domain/entities/login_entity.dart';
import 'package:flutter_architecture_project_use_bloc/features/login/domain/repositories/login_repository.dart';

class LoginUseCase implements UseCase<LoginEntity, Params<LoginParam>> {
  final LoginRepository loginRepository;
  LoginUseCase(this.loginRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(Params<LoginParam> params) async {
    return await loginRepository.login(params.data);
  }
}
