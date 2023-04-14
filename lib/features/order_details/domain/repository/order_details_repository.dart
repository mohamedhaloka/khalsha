import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';
import '../../../orders/data/models/order_model.dart';

abstract class OrderDetailsRepository {
  Future<Either<Failure, OrderModel>> getOrderDetails(String type, int id);
}
