import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/land_shipping/data/models/land_shipping_data.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../domain/repository/land_shipping_repository.dart';
import '../data_source/land_shipping_remote_data_source.dart';

class LandShippingRepositoryImpl extends LandShippingRepository {
  final LandShippingRemoteDataSource _landShippingRemoteDataSource;
  LandShippingRepositoryImpl(this._landShippingRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      LandShippingData data) async {
    try {
      final result = await _landShippingRemoteDataSource.createOrder(
        data,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
      LandShippingData data) async {
    try {
      final result = await _landShippingRemoteDataSource.updateOrder(
        data,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }
}
