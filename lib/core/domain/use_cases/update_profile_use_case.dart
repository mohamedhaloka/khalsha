import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/repository/core_repository.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';

class UpdateProfileUseCase extends UseCase<String, UpdateProfileParams> {
  final CoreRepository _coreRepository;
  UpdateProfileUseCase(this._coreRepository);

  @override
  Future<Either<Failure, String>> execute(UpdateProfileParams params) {
    params.loading(true);
    final call = _coreRepository.updateProfile(
      params.name,
      params.email,
      params.mobile,
      params.bio,
      params.commercialCertificate,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class UpdateProfileParams extends Params {
  final String name, email, mobile, bio, commercialCertificate;
  UpdateProfileParams({
    required super.loading,
    required this.name,
    required this.email,
    required this.mobile,
    required this.bio,
    required this.commercialCertificate,
  });
}
