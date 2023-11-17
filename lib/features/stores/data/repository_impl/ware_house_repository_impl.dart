import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/stores/data/data_source/ware_house_remote_data_source.dart';
import 'package:khalsha/features/stores/data/models/ware_house_data_model.dart';
import 'package:khalsha/features/stores/domain/repository/ware_house_repository.dart';

class WareHouseRepositoryImpl extends BaseRepositoryImpl
    implements WareHouseRepository {
  final WareHouseRemoteDataSource _wareHouseRemoteDataSource;
  WareHouseRepositoryImpl(this._wareHouseRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      WareHouseData wareHouseData) async {
    return request(() async {
      final result =
          await _wareHouseRemoteDataSource.createOrder(wareHouseData);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
      WareHouseData wareHouseData) async {
    return request(() async {
      final result =
          await _wareHouseRemoteDataSource.updateOrder(wareHouseData);
      return right(result);
    });
  }
}
