import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/marine_shipping/data/data_source/marine_shipment_remote_data_source.dart';
import 'package:khalsha/features/marine_shipping/data/models/marine_shipment_data.dart';
import 'package:khalsha/features/marine_shipping/domain/repository/marine_shipment_repository.dart';

class MarineShipmentRepositoryImpl extends BaseRepositoryImpl
    implements MarineShipmentRepository {
  final MarineShipmentRemoteDataSource _marineShipmentRemoteDataSource;
  MarineShipmentRepositoryImpl(this._marineShipmentRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      MarineShipmentData marineShipmentData) async {
    return request(() async {
      final result =
          await _marineShipmentRemoteDataSource.createOrder(marineShipmentData);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
      MarineShipmentData marineShipmentData) async {
    return request(() async {
      final result =
          await _marineShipmentRemoteDataSource.updateOrder(marineShipmentData);
      return right(result);
    });
  }
}
