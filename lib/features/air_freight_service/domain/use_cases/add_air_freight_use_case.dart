import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/air_freight_service/domain/repository/air_freight_repository.dart';

import 'package:khalsha/features/air_freight_service/data/models/air_freight_data.dart';

class AddAirFreightUseCase
    extends UseCase<Map<String, dynamic>, AirFreightUseCaseParams> {
  final AirFreightRepository _airFreightRepository;
  AddAirFreightUseCase(this._airFreightRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      AirFreightUseCaseParams params) {
    params.loading(true);
    final call = _airFreightRepository.createOrder(params.data);
    call.then((_) => params.loading(false));
    return call;
  }
}

class AirFreightUseCaseParams extends Params {
  final AirFreightData data;

  AirFreightUseCaseParams({
    required super.loading,
    required this.data,
  });
}
