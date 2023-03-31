import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/domain/error/failures.dart';

import '../../domain/repository/reset_password_repository.dart';
import '../source/reset_password_remote_data_source.dart';

class ResetPasswordRepositoryImpl extends ResetPasswordRepository {
  final ResetPasswordRemoteDataSource _resetPasswordRemoteDataSource;
  ResetPasswordRepositoryImpl(this._resetPasswordRemoteDataSource);

  @override
  Future<Either<Failure, String>> resetPassword(
    String account,
    String code,
    String password,
    String confirmationPassword,
  ) async {
    try {
      final result = await _resetPasswordRemoteDataSource.resetPassword(
        account,
        code,
        password,
        confirmationPassword,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.data.toString()));
    }
  }
}
