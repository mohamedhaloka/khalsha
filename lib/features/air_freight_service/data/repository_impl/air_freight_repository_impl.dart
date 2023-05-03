import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/air_freight_service/data/data_source/air_freight_remote_data_source.dart';
import 'package:khalsha/features/air_freight_service/data/models/air_freight_data.dart';
import 'package:khalsha/features/air_freight_service/domain/repository/air_freight_repository.dart';

import '../../../../core/domain/error/exceptions.dart';

class AirFreightRepositoryImpl extends AirFreightRepository {
  final AirFreightRemoteDataSource _airFreightRemoteDataSource;
  AirFreightRepositoryImpl(this._airFreightRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      AirFreightData airFreightData) async {
    try {
      final result =
          await _airFreightRemoteDataSource.createOrder(airFreightData);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(
        ServerFailure(statusMessage: e.response!.data['message'].toString()),
      );
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> updateOrder(
      AirFreightData airFreightData) async {
    try {
      final result =
          await _airFreightRemoteDataSource.updateOrder(airFreightData);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(
        ServerFailure(statusMessage: e.response!.data['message'].toString()),
      );
    }
  }
}
