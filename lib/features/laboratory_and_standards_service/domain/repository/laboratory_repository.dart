import 'package:dartz/dartz.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/models/laboratory_data.dart';

import 'package:khalsha/core/domain/error/failures.dart';

abstract class LaboratoryRepository {
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
    LaboratoryData laboratoryData,
  );

  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
    LaboratoryData laboratoryData,
  );
}
