import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/data/models/user_data_model.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/domain/error/failures.dart';
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
      return left(ServerFailure(statusMessage: json.encode(e.response!.data)));
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
      return left(ServerFailure(statusMessage: json.encode(e.response!.data)));
    }
  }
}
