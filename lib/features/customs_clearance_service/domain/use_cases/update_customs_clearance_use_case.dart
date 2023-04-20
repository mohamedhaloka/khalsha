import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/customs_clearance_service/domain/repository/customs_clearance_repository.dart';

import 'add_customs_clearance_use_case.dart';

class UpdateCustomsClearanceUseCase
    extends UseCase<Map<String, dynamic>, CustomsClearanceUseCaseParams> {
  final CustomsClearanceRepository _clearanceRepository;
  UpdateCustomsClearanceUseCase(this._clearanceRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      CustomsClearanceUseCaseParams params) {
    params.loading(true);
    final call = _clearanceRepository.updateOrder(params.customsClearanceData);
    call.then((_) => params.loading(false));
    return call;
  }
}
