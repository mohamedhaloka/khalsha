import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/laboratory_and_standards_service/domain/repository/laboratory_repository.dart';

import 'package:khalsha/features/laboratory_and_standards_service/domain/use_case/add_laboratory_use_case.dart';

class UpdateLaboratoryUseCase
    extends UseCase<Map<String, dynamic>, LaboratoryUseCaseParams> {
  final LaboratoryRepository _laboratoryRepository;
  UpdateLaboratoryUseCase(this._laboratoryRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      LaboratoryUseCaseParams params) {
    params.loading(true);
    final call = _laboratoryRepository.updateOrder(params.laboratoryData);
    call.then((value) => params.loading(false));
    return call;
  }
}
