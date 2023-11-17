import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/repository/core_repository.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';

class GetParticularEnvDataUseCase
    extends UseCase<List<DataModel>, GetParticularEnvDataUseCaseParams> {
  final CoreRepository _coreRepository;
  GetParticularEnvDataUseCase(this._coreRepository);

  @override
  Future<Either<Failure, List<DataModel>>> execute(
      GetParticularEnvDataUseCaseParams params) async {
    params.loading(true);
    final call = await _coreRepository.getParticularEnvData(params.pageName);
    params.loading(false);
    return call;
  }
}

class GetParticularEnvDataUseCaseParams extends Params {
  final String pageName;
  GetParticularEnvDataUseCaseParams({
    required super.loading,
    required this.pageName,
  });
}
