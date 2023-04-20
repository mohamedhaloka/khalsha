import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';

import '../../data/models/marine_shipment_data.dart';

abstract class MarineShipmentRepository {
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
    MarineShipmentData marineShipmentData,
  );
}
