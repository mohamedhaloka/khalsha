import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/account_settings/domain/repository/account_settings_repository.dart';

class ChangePasswordUseCase
    extends UseCase<String, ChangePasswordUseCaseParams> {
  final AccountSettingsRepository _accountSettingsRepository;
  ChangePasswordUseCase(this._accountSettingsRepository);

  @override
  Future<Either<Failure, String>> execute(
    ChangePasswordUseCaseParams params,
  ) async {
    params.loading(true);
    final call = _accountSettingsRepository.changePassword(
      currentPassword: params.oldPassword,
      newPassword: params.newPassword,
      confirmNewPassword: params.newPasswordConfirmation,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class ChangePasswordUseCaseParams extends Params {
  final String oldPassword, newPassword, newPasswordConfirmation;

  ChangePasswordUseCaseParams({
    required super.loading,
    required this.oldPassword,
    required this.newPassword,
    required this.newPasswordConfirmation,
  });
}
