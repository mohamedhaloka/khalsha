import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';
import 'package:khalsha/features/marine_shipping/data/data_source/marine_shipment_remote_data_source.dart';
import 'package:khalsha/features/marine_shipping/data/models/marine_shipment_data.dart';
import 'package:khalsha/features/marine_shipping/domain/repository/marine_shipment_repository.dart';

import '../../../../core/domain/error/exceptions.dart';

class MarineShipmentRepositoryImpl extends MarineShipmentRepository {
  final MarineShipmentRemoteDataSource _marineShipmentRemoteDataSource;
  MarineShipmentRepositoryImpl(this._marineShipmentRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      MarineShipmentData marineShipmentData) async {
    try {
      final result =
          await _marineShipmentRemoteDataSource.createOrder(marineShipmentData);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
      MarineShipmentData marineShipmentData) async {
    try {
      final result =
          await _marineShipmentRemoteDataSource.updateOrder(marineShipmentData);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }
}
