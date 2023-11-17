import 'package:dartz/dartz.dart';
import 'package:khalsha/features/air_freight_service/data/models/air_freight_data.dart';

import 'package:khalsha/core/domain/error/failures.dart';

abstract class AirFreightRepository {
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
    AirFreightData airFreightData,
  );

  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
    AirFreightData airFreightData,
  );
}
