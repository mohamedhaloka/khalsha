import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';

import '../../data/models/settlement.dart';

abstract class SettlementRepository {
  Future<Either<Failure, List<SettlementModel>>> getSettlements();
}
