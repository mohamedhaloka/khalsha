import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/orders/data/data_source/orders_remote_data_source.dart';
import 'package:khalsha/features/orders/data/models/order_model.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../domain/repository/orders_repository.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  final OrdersRemoteDataSource _ordersRemoteDataSource;
  OrdersRepositoryImpl(this._ordersRemoteDataSource);

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders(String type) async {
    try {
      final result = await _ordersRemoteDataSource.getOrders(type);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.data.toString()));
    }
  }
}
