import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/new_orders/data/data_source/new_orders_remote_data_source.dart';
import 'package:khalsha/features/new_orders/data/models/new_order_model.dart';
import 'package:khalsha/features/new_orders/domain/repository/new_orders_repository.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';

import '../../../../core/domain/error/exceptions.dart';

class NewOrdersRepositoryImpl extends NewOrdersRepository {
  final NewOrdersRemoteDataSource _newOrdersRemoteDataSource;
  NewOrdersRepositoryImpl(this._newOrdersRemoteDataSource);

  @override
  Future<Either<Failure, List<NewOrderModel>>> getNewOrders(String type) async {
    try {
      final result = await _newOrdersRemoteDataSource.getNewOrders(type);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }
}
