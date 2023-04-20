import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/stores/data/models/ware_house_data_model.dart';
import 'package:khalsha/features/stores/domain/repository/ware_house_repository.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../data_source/ware_house_remote_data_source.dart';

class WareHouseRepositoryImpl extends WareHouseRepository {
  final WareHouseRemoteDataSource _wareHouseRemoteDataSource;
  WareHouseRepositoryImpl(this._wareHouseRemoteDataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      WareHouseData wareHouseData) async {
    try {
      final result =
          await _wareHouseRemoteDataSource.createOrder(wareHouseData);
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
      WareHouseData wareHouseData) async {
    try {
      final result =
          await _wareHouseRemoteDataSource.updateOrder(wareHouseData);
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
