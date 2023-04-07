import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/repository/core_repository.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';

class UpdateProfilePhotoUseCase
    extends UseCase<String, UpdateProfilePhotoParams> {
  final CoreRepository _coreRepository;
  UpdateProfilePhotoUseCase(this._coreRepository);

  @override
  Future<Either<Failure, String>> execute(UpdateProfilePhotoParams params) {
    params.loading(true);
    final call = _coreRepository.updateProfilePhoto(params.photoPath);
    call.then((_) => params.loading(false));
    return call;
  }
}

class UpdateProfilePhotoParams extends Params {
  final String photoPath;
  UpdateProfilePhotoParams({
    required super.loading,
    required this.photoPath,
  });
}
