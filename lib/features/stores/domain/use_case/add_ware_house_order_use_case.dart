import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/stores/data/models/ware_house_data_model.dart';
import 'package:khalsha/features/stores/domain/repository/ware_house_repository.dart';

class AddWareHouseOrderUseCase
    extends UseCase<Map<String, dynamic>, WareHouseOrderUseCaseParams> {
  final WareHouseRepository _wareHouseRepository;
  AddWareHouseOrderUseCase(this._wareHouseRepository);

  @override
  Future<Either<Failure, Map<String, dynamic>>> execute(
      WareHouseOrderUseCaseParams params) async {
    params.loading(true);
    final call = _wareHouseRepository.createOrder(params.data);
    call.then((_) => params.loading(false));
    return call;
  }
}

class WareHouseOrderUseCaseParams extends Params {
  final WareHouseData data;

  WareHouseOrderUseCaseParams({
    required super.loading,
    required this.data,
  });
}
