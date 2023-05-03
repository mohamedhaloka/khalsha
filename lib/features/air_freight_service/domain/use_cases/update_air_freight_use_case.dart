import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/air_freight_service/domain/repository/air_freight_repository.dart';

import 'add_air_freight_use_case.dart';

class UpdateAirFreightUseCase
    extends UseCase<Map<String, dynamic>, AirFreightUseCaseParams> {
  final AirFreightRepository _airFreightRepository;
  UpdateAirFreightUseCase(this._airFreightRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      AirFreightUseCaseParams params) {
    params.loading(true);
    final call = _airFreightRepository.updateOrder(params.data);
    call.then((_) => params.loading(false));
    return call;
  }
}
