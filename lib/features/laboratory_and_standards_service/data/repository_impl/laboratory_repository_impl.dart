import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/data_source/laboratory_remote_data_source.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/models/laboratory_data.dart';
import 'package:khalsha/features/laboratory_and_standards_service/domain/repository/laboratory_repository.dart';

class LaboratoryRepositoryImpl extends BaseRepositoryImpl
    implements LaboratoryRepository {
  final LaboratoryRemoteDataSource _laboratoryRemoteDataSource;
  LaboratoryRepositoryImpl(this._laboratoryRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      LaboratoryData laboratoryData) async {
    return request(() async {
      final result =
          await _laboratoryRemoteDataSource.createOrder(laboratoryData);
      return right(result);
    });
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
      LaboratoryData laboratoryData) async {
    return request(() async {
      final result =
          await _laboratoryRemoteDataSource.updateOrder(laboratoryData);
      return right(result);
    });
  }
}
