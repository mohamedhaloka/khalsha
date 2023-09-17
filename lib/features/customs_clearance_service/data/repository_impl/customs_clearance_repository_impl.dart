import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';
import 'package:khalsha/features/customs_clearance_service/data/data_source/custom_clearance_remote_data_source.dart';
import 'package:khalsha/features/customs_clearance_service/data/models/customs_clearance_data.dart';

import '../../domain/repository/customs_clearance_repository.dart';

class CustomsClearanceRepositoryImpl extends CustomsClearanceRepository {
  final CustomsClearanceRemoteDataSource _clearanceRemoteDataSource;
  CustomsClearanceRepositoryImpl(this._clearanceRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      CustomsClearanceData customsClearanceData) async {
    try {
      final result =
          await _clearanceRemoteDataSource.createOrder(customsClearanceData);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
      CustomsClearanceData customsClearanceData) async {
    try {
      final result =
          await _clearanceRemoteDataSource.updateOrder(customsClearanceData);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }
}
