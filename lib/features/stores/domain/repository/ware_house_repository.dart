import 'package:dartz/dartz.dart';
import 'package:khalsha/features/stores/data/models/ware_house_data_model.dart';

import '../../../../core/domain/error/failures.dart';

abstract class WareHouseRepository {
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
    WareHouseData wareHouseData,
  );

  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
    WareHouseData wareHouseData,
  );
}
