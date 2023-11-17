import 'package:dartz/dartz.dart';

import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/orders/domain/entities/order_model.dart';

abstract class OrderDetailsRepository {
  Future<Either<Failure, OrderModel>> getOrderDetails(String type, int id);

  Future<Either<Failure, String>> updateStep(
    String type,
    int statusId,
    String status,
    String note,
  );

  Future<Either<Failure, String>> acceptRejectOffer({
    required String type,
    required String status,
    required String orderId,
  });

  Future<Either<Failure, Unit>> rateOrder(
    double rate,
    String feedback,
    String orderId,
    String module,
  );
}
