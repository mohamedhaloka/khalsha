import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/data/models/user_data_model.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';
import 'package:khalsha/features/root/data/source/root_remote_data_source.dart';

import '../../domain/repository/root_repository.dart';

class RootRepositoryImpl extends RootRepository {
  final RootRemoteDataSource _rootRemoteDataSource;
  RootRepositoryImpl(this._rootRemoteDataSource);

  @override
  Future<Either<Failure, UserData>> refreshToken() async {
    try {
      final result = await _rootRemoteDataSource.refreshToken();
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, String>> logOut() async {
    try {
      final result = await _rootRemoteDataSource.logOut();
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, String>> updateFCMToken(String fcmToken) async {
    try {
      final result = await _rootRemoteDataSource.updateFCMToken(fcmToken);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }
}
