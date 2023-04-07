import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';

import '../../data/models/customs_clearance_data.dart';

abstract class CustomsClearanceRepository {
  Future<Either<Failure, String>> createOrder(
    CustomsClearanceData customsClearanceData,
  );
}
