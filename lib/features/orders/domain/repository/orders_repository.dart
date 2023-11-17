import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';

import 'package:khalsha/features/orders/domain/entities/order_model.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<OrderModel>>> getOrders(String type, int page);
}
