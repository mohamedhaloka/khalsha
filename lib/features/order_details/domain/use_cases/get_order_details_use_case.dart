import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/order_details/domain/repository/order_details_repository.dart';
import 'package:khalsha/features/orders/data/models/order_model.dart';

class GetOrderDetailsUseCase
    extends UseCase<OrderModel, GetOrderDetailsUseCaseParams> {
  final OrderDetailsRepository _orderDetailsRepository;
  GetOrderDetailsUseCase(this._orderDetailsRepository);

  @override
  Future<Either<Failure, OrderModel>> execute(
      GetOrderDetailsUseCaseParams params) {
    params.loading(true);
    final call = _orderDetailsRepository.getOrderDetails(
      params.type,
      params.orderId,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class GetOrderDetailsUseCaseParams extends Params {
  final String type;
  final int orderId;
  GetOrderDetailsUseCaseParams({
    required super.loading,
    required this.type,
    required this.orderId,
  });
}
