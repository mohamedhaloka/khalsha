import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/customs_clearance_service/domain/repository/customs_clearance_repository.dart';

import '../../data/models/customs_clearance_data.dart';

class AddCustomsClearanceUseCase
    extends UseCase<String, AddCustomsClearanceUseCaseParams> {
  final CustomsClearanceRepository _clearanceRepository;
  AddCustomsClearanceUseCase(this._clearanceRepository);

  @override
  Future<Either<Failure, String>> execute(
      AddCustomsClearanceUseCaseParams params) {
    params.loading(true);
    final call = _clearanceRepository.createOrder(params.customsClearanceData);
    call.then((_) => params.loading(false));
    return call;
  }
}

class AddCustomsClearanceUseCaseParams extends Params {
  final CustomsClearanceData customsClearanceData;

  AddCustomsClearanceUseCaseParams({
    required super.loading,
    required this.customsClearanceData,
  });
}
