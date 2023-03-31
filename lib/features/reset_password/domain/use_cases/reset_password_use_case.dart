import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/reset_password/domain/repository/reset_password_repository.dart';

class ResetPasswordUseCase extends UseCase<String, ResetPasswordParams> {
  final ResetPasswordRepository _resetPasswordRepository;
  ResetPasswordUseCase(this._resetPasswordRepository);

  @override
  Future<Either<Failure, String>> execute(ResetPasswordParams params) {
    params.loading(true);
    final call = _resetPasswordRepository.resetPassword(
      params.account,
      params.code,
      params.password,
      params.confirmationPassword,
    );
    call.then((_) => params.loading(false));

    return call;
  }
}

class ResetPasswordParams extends Params {
  final String account, code, password, confirmationPassword;

  ResetPasswordParams({
    required super.loading,
    required this.account,
    required this.code,
    required this.password,
    required this.confirmationPassword,
  });
}
