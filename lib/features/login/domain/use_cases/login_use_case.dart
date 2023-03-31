import 'package:dartz/dartz.dart';
import 'package:khalsha/features/login/domain/repository/login_repository.dart';

import '../../../../core/data/models/user_data_model.dart';
import '../../../../core/domain/error/failures.dart';
import '../../../../core/domain/use_cases/use_case.dart';

class LoginUseCase extends UseCase<UserData, LoginParams> {
  final LoginRepository _loginRepository;
  LoginUseCase(this._loginRepository);

  @override
  Future<Either<Failure, UserData>> execute(LoginParams params) {
    params.loading(true);
    final call = _loginRepository.login(params.account, params.password);
    call.then((_) => params.loading(false));
    return call;
  }
}

class LoginParams extends Params {
  final String account, password;
  LoginParams({
    required super.loading,
    required this.password,
    required this.account,
  });
}
