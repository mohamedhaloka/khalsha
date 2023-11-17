import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/marine_shipping/data/models/marine_shipment_data.dart';

import 'package:khalsha/features/marine_shipping/domain/repository/marine_shipment_repository.dart';

class AddMarineShipmentUseCase
    extends UseCase<Map<String, dynamic>, MarineShipmentUseCaseParams> {
  final MarineShipmentRepository _marineShipmentRepository;
  AddMarineShipmentUseCase(this._marineShipmentRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      MarineShipmentUseCaseParams params) {
    params.loading(true);
    final call = _marineShipmentRepository.createOrder(params.data);
    call.then((_) => params.loading(false));
    return call;
  }
}

class MarineShipmentUseCaseParams extends Params {
  final MarineShipmentData data;

  MarineShipmentUseCaseParams({
    required super.loading,
    required this.data,
  });
}
