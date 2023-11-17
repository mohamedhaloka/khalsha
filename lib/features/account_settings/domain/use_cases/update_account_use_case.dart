import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/account_settings/domain/repository/account_settings_repository.dart';

class UpdateAccountUseCase extends UseCase<String, UpdateAccountUseCaseParams> {
  final AccountSettingsRepository _accountSettingsRepository;
  UpdateAccountUseCase(this._accountSettingsRepository);

  @override
  Future<Either<Failure, String>> execute(
    UpdateAccountUseCaseParams params,
  ) async {
    params.loading(true);
    final call = _accountSettingsRepository.updateAccount(
      name: params.name,
      email: params.email,
      mobile: params.mobile,
      commercialCert: params.commercialCert,
      bio: params.bio,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class UpdateAccountUseCaseParams extends Params {
  final String name, email, mobile, bio, commercialCert;

  UpdateAccountUseCaseParams({
    required super.loading,
    required this.name,
    required this.email,
    required this.mobile,
    required this.bio,
    required this.commercialCert,
  });
}
