import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/customs_clearance_service/data/data_source/custom_clearance_remote_data_source.dart';
import 'package:khalsha/features/customs_clearance_service/data/models/customs_clearance_data.dart';
import 'package:khalsha/features/customs_clearance_service/domain/repository/customs_clearance_repository.dart';

class CustomsClearanceRepositoryImpl extends BaseRepositoryImpl
    implements CustomsClearanceRepository {
  final CustomsClearanceRemoteDataSource _clearanceRemoteDataSource;
  CustomsClearanceRepositoryImpl(this._clearanceRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      CustomsClearanceData customsClearanceData) async {
    return request(() async {
      final result =
          await _clearanceRemoteDataSource.createOrder(customsClearanceData);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
      CustomsClearanceData customsClearanceData) async {
    return request(() async {
      final result =
          await _clearanceRemoteDataSource.updateOrder(customsClearanceData);
      return right(result);
    });
  }
}
