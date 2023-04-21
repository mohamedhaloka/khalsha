import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';

import '../repository/marine_shipment_repository.dart';
import 'add_marine_shipment_use_case.dart';

class UpdateMarineShipmentUseCase
    extends UseCase<Map<String, dynamic>, MarineShipmentUseCaseParams> {
  final MarineShipmentRepository _marineShipmentRepository;
  UpdateMarineShipmentUseCase(this._marineShipmentRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      MarineShipmentUseCaseParams params) {
    params.loading(true);
    final call = _marineShipmentRepository.updateOrder(params.data);
    call.then((_) => params.loading(false));
    return call;
  }
}
