import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/orders/domain/use_cases/get_orders_use_case.dart';

import '../../data/models/new_order_model.dart';
import '../repository/new_orders_repository.dart';

class GetNewOrdersUseCase
    extends UseCase<List<NewOrderModel>, GetOrdersParams> {
  final NewOrdersRepository _newOrdersRepository;
  GetNewOrdersUseCase(this._newOrdersRepository);

  @override
  Future<Either<Failure, List<NewOrderModel>>> execute(
      GetOrdersParams params) async {
    params.loading(true);
    final call = _newOrdersRepository.getNewOrders(params.type);
    call.then((_) => params.loading(false));
    return call;
  }
}
