import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';

import 'package:khalsha/features/home/data/models/statistics_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, StatisticsModel>> getStatistics();
}
