import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/order_details/domain/repository/order_details_repository.dart';

class RateOrderUseCase extends UseCase<Unit, RateOrderUseCaseParams> {
  final OrderDetailsRepository _orderDetailsRepository;
  RateOrderUseCase(this._orderDetailsRepository);

  @override
  Future<Either<Failure, Unit>> execute(RateOrderUseCaseParams params) {
    params.loading(true);
    final call = _orderDetailsRepository.rateOrder(
      params.rate,
      params.feedback,
      params.orderId,
      params.module,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class RateOrderUseCaseParams extends Params {
  final String feedback, orderId, module;
  final double rate;
  RateOrderUseCaseParams({
    required super.loading,
    required this.rate,
    required this.feedback,
    required this.module,
    required this.orderId,
  });
}
