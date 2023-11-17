import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/land_shipping/data/data_source/land_shipping_remote_data_source.dart';
import 'package:khalsha/features/land_shipping/data/models/land_shipping_data.dart';
import 'package:khalsha/features/land_shipping/domain/repository/land_shipping_repository.dart';

class LandShippingRepositoryImpl extends BaseRepositoryImpl
    implements LandShippingRepository {
  final LandShippingRemoteDataSource _landShippingRemoteDataSource;
  LandShippingRepositoryImpl(this._landShippingRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      LandShippingData data) async {
    return request(() async {
      final result = await _landShippingRemoteDataSource.createOrder(
        data,
      );
      return right(result);
    });
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
      LandShippingData data) async {
    return request(() async {
      final result = await _landShippingRemoteDataSource.updateOrder(
        data,
      );
      return right(result);
    });
  }
}
