import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/order_details/domain/repository/order_details_repository.dart';

class UpdateOrderStatusUseCase
    extends UseCase<String, UpdateOrderStatusUseCaseParams> {
  final OrderDetailsRepository _orderDetailsRepository;
  UpdateOrderStatusUseCase(this._orderDetailsRepository);

  @override
  Future<Either<Failure, String>> execute(
    UpdateOrderStatusUseCaseParams params,
  ) {
    params.loading(true);
    final call = _orderDetailsRepository.updateStep(
      params.type,
      params.statusId,
      params.status,
      params.comment,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class UpdateOrderStatusUseCaseParams extends Params {
  final String type, comment, status;
  final int statusId;
  UpdateOrderStatusUseCaseParams({
    required super.loading,
    required this.type,
    required this.statusId,
    required this.status,
    required this.comment,
  });
}
