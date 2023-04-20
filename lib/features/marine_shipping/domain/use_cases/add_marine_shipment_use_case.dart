import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/marine_shipping/data/models/marine_shipment_data.dart';

import '../repository/marine_shipment_repository.dart';

class AddMarineShipmentUseCase
    extends UseCase<Map<String, dynamic>, AddMarineShipmentUseCaseParams> {
  final MarineShipmentRepository _marineShipmentRepository;
  AddMarineShipmentUseCase(this._marineShipmentRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      AddMarineShipmentUseCaseParams params) {
    params.loading(true);
    final call = _marineShipmentRepository.createOrder(params.data);
    call.then((_) => params.loading(false));
    return call;
  }
}

class AddMarineShipmentUseCaseParams extends Params {
  final MarineShipmentData data;

  AddMarineShipmentUseCaseParams({
    required super.loading,
    required this.data,
  });
}
