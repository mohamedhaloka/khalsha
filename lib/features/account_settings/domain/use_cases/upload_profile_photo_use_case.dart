import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/account_settings/domain/repository/account_settings_repository.dart';

class UploadProfilePhotoUseCase
    extends UseCase<String, UploadProfilePhotoUseCaseParams> {
  final AccountSettingsRepository _accountSettingsRepository;
  UploadProfilePhotoUseCase(this._accountSettingsRepository);

  @override
  Future<Either<Failure, String>> execute(
    UploadProfilePhotoUseCaseParams params,
  ) async {
    params.loading(true);
    final call = _accountSettingsRepository.uploadProfilePhoto(
      imagePath: params.imagePath,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class UploadProfilePhotoUseCaseParams extends Params {
  final String imagePath;

  UploadProfilePhotoUseCaseParams({
    required super.loading,
    required this.imagePath,
  });
}
