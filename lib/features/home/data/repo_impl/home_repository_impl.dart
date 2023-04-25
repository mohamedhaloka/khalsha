import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/features/home/data/data_source/home_remote_data_source.dart';
import 'package:khalsha/features/home/domain/repository/home_repository.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../../../core/domain/error/failures.dart';
import '../models/statistics_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  HomeRepositoryImpl(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, StatisticsModel>> getStatistics() async {
    try {
      final result = await _homeRemoteDataSource.getStatistics();
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.data.toString()));
    }
  }
}
