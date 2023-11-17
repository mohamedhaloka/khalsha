import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/forget_password/domain/repository/forget_password_repository.dart';

class ForgetPasswordUseCase extends UseCase<String, ForgetPasswordParams> {
  final ForgetPasswordRepository _forgetPasswordRepository;
  ForgetPasswordUseCase(this._forgetPasswordRepository);

  @override
  Future<Either<Failure, String>> execute(ForgetPasswordParams params) {
    params.loading(true);
    final call = _forgetPasswordRepository.forgetPassword(params.account);
    call.then((_) => params.loading(false));

    return call;
  }
}

class ForgetPasswordParams extends Params {
  final String account;

  ForgetPasswordParams({
    required super.loading,
    required this.account,
  });
}
