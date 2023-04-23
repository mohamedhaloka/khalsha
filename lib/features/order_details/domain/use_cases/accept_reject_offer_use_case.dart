import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/order_details/domain/repository/order_details_repository.dart';

class AcceptRejectOfferUseCase
    extends UseCase<String, AcceptRejectOfferUseCaseParams> {
  final OrderDetailsRepository _orderDetailsRepository;
  AcceptRejectOfferUseCase(this._orderDetailsRepository);

  @override
  Future<Either<Failure, String>> execute(
      AcceptRejectOfferUseCaseParams params) {
    params.loading(true);
    final call = _orderDetailsRepository.acceptRejectOffer(
      type: params.type,
      status: params.status,
      orderId: params.orderId,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class AcceptRejectOfferUseCaseParams extends Params {
  final String type, status, orderId;
  AcceptRejectOfferUseCaseParams({
    required super.loading,
    required this.type,
    required this.status,
    required this.orderId,
  });
}
