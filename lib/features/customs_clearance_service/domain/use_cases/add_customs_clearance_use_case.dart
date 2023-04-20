import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/customs_clearance_service/domain/repository/customs_clearance_repository.dart';

import '../../data/models/customs_clearance_data.dart';

class AddCustomsClearanceUseCase
    extends UseCase<Map<String, dynamic>, CustomsClearanceUseCaseParams> {
  final CustomsClearanceRepository _clearanceRepository;
  AddCustomsClearanceUseCase(this._clearanceRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      CustomsClearanceUseCaseParams params) {
    params.loading(true);
    final call = _clearanceRepository.createOrder(params.customsClearanceData);
    call.then((_) => params.loading(false));
    return call;
  }
}

class CustomsClearanceUseCaseParams extends Params {
  final CustomsClearanceData customsClearanceData;

  CustomsClearanceUseCaseParams({
    required super.loading,
    required this.customsClearanceData,
  });
}
