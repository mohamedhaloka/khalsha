import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/models/laboratory_data.dart';
import 'package:khalsha/features/laboratory_and_standards_service/domain/repository/laboratory_repository.dart';

class AddLaboratoryUseCase
    extends UseCase<Map<String, dynamic>, LaboratoryUseCaseParams> {
  final LaboratoryRepository _laboratoryRepository;
  AddLaboratoryUseCase(this._laboratoryRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      LaboratoryUseCaseParams params) {
    params.loading(true);
    final call = _laboratoryRepository.createOrder(params.laboratoryData);
    call.then((value) => params.loading(false));
    return call;
  }
}

class LaboratoryUseCaseParams extends Params {
  final LaboratoryData laboratoryData;
  LaboratoryUseCaseParams({
    required super.loading,
    required this.laboratoryData,
  });
}
