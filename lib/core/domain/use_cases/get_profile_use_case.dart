import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/models/profile_data_model.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/repository/core_repository.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';

class GetProfileUseCase extends UseCase<ProfileDataModel, Params> {
  final CoreRepository _coreRepository;
  GetProfileUseCase(this._coreRepository);

  @override
  Future<Either<Failure, ProfileDataModel>> execute(Params params) {
    params.loading(true);
    final call = _coreRepository.getProfile();
    call.then((_) => params.loading(false));
    return call;
  }
}
