import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';

import 'package:khalsha/features/customs_clearance_service/data/models/customs_clearance_data.dart';

abstract class CustomsClearanceRepository {
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
    CustomsClearanceData customsClearanceData,
  );

  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
    CustomsClearanceData customsClearanceData,
  );
}
