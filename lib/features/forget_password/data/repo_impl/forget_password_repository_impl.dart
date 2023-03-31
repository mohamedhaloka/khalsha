import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/forget_password/domain/repository/forget_password_repository.dart';

import '../source/forget_password_remote_data_source.dart';

class ForgetPasswordRepositoryImpl extends ForgetPasswordRepository {
  final ForgetPasswordRemoteDataSource _forgetPasswordRemoteDataSource;
  ForgetPasswordRepositoryImpl(this._forgetPasswordRemoteDataSource);

  @override
  Future<Either<Failure, String>> forgetPassword(String account) async {
    try {
      final result =
          await _forgetPasswordRemoteDataSource.forgetPassword(account);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.data.toString()));
    }
  }
}
