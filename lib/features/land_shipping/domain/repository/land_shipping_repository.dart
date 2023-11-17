import 'package:dartz/dartz.dart';

import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/land_shipping/data/models/land_shipping_data.dart';

abstract class LandShippingRepository {
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
    LandShippingData data,
  );

  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
    LandShippingData data,
  );
}
