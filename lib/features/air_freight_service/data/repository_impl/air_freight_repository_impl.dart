import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/air_freight_service/data/data_source/air_freight_remote_data_source.dart';
import 'package:khalsha/features/air_freight_service/data/models/air_freight_data.dart';
import 'package:khalsha/features/air_freight_service/domain/repository/air_freight_repository.dart';

class AirFreightRepositoryImpl extends BaseRepositoryImpl
    implements AirFreightRepository {
  final AirFreightRemoteDataSource _airFreightRemoteDataSource;
  AirFreightRepositoryImpl(this._airFreightRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      AirFreightData airFreightData) async {
    return request(() async {
      final result =
          await _airFreightRemoteDataSource.createOrder(airFreightData);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
      AirFreightData airFreightData) async {
    return request(() async {
      final result =
          await _airFreightRemoteDataSource.updateOrder(airFreightData);
      return right(result);
    });
  }
}
