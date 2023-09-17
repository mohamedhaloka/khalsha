import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/data_source/laboratory_remote_data_source.dart';
import 'package:khalsha/features/laboratory_and_standards_service/data/models/laboratory_data.dart';
import 'package:khalsha/features/laboratory_and_standards_service/domain/repository/laboratory_repository.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';

import '../../../../core/domain/error/exceptions.dart';

class LaboratoryRepositoryImpl extends LaboratoryRepository {
  final LaboratoryRemoteDataSource _laboratoryRemoteDataSource;
  LaboratoryRepositoryImpl(this._laboratoryRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      LaboratoryData laboratoryData) async {
    try {
      final result =
          await _laboratoryRemoteDataSource.createOrder(laboratoryData);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
      LaboratoryData laboratoryData) async {
    try {
      final result =
          await _laboratoryRemoteDataSource.updateOrder(laboratoryData);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }
}
