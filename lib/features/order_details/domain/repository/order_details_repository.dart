import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';
import '../../../orders/domain/entities/order_model.dart';

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
}
