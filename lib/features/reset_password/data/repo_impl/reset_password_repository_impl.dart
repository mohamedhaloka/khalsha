import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/utils/constants.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';
import 'package:khalsha/features/reset_password/data/source/reset_password_remote_data_source.dart';
import 'package:khalsha/features/reset_password/domain/repository/reset_password_repository.dart';

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
      return left(ServerFailure(
        errorCode: ServerErrorCode.serverError,
        message: e.errorMessage,
      ));
    } on DioException catch (e) {
      return left(ServerFailure(
        errorCode: ServerErrorCode.serverError,
        message: e.response.getErrorMessage(),
      ));
    }
  }
}
