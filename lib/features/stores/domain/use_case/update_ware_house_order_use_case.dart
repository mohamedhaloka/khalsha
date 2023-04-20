import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/stores/domain/repository/ware_house_repository.dart';

import 'add_ware_house_order_use_case.dart';

class UpdateWareHouseOrderUseCase
    extends UseCase<Map<String, dynamic>, WareHouseOrderUseCaseParams> {
  final WareHouseRepository _wareHouseRepository;
  UpdateWareHouseOrderUseCase(this._wareHouseRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      WareHouseOrderUseCaseParams params) async {
    params.loading(true);
    final call = _wareHouseRepository.updateOrder(params.data);
    call.then((_) => params.loading(false));
    return call;
  }
}
