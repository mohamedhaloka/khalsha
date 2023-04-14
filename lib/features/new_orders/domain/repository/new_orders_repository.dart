import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';

import '../../data/models/new_order_model.dart';

abstract class NewOrdersRepository {
  Future<Either<Failure, List<NewOrderModel>>> getNewOrders(String type);
}
