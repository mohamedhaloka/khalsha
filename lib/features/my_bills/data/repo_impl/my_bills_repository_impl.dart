import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/my_bills/data/data_source/my_bills_remote_data_source.dart';
import 'package:khalsha/features/my_bills/domain/repository/my_bills_repository.dart';
import 'package:khalsha/features/orders/domain/entities/order_model.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';

import '../../../../core/domain/error/exceptions.dart';

class MyBillsRepositoryImpl extends MyBillsRepository {
  final MyBillsRemoteDataSource _remoteDataSource;
  MyBillsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<OrderModel>>> getBills(
      {required String type, required int pageIndex}) async {
    try {
      final result = await _remoteDataSource.getBills(type, pageIndex);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }
}
