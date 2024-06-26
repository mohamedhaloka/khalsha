import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';
import 'package:khalsha/features/otp/data/source/otp_remote_data_source.dart';
import 'package:khalsha/features/otp/domain/repository/otp_repository.dart';

import '../../domain/entites/enums/verify_type.dart';

class OTPRepositoryImpl extends OTPRepository {
  final OTPRemoteDataSource _otpRemoteDataSource;
  OTPRepositoryImpl(this._otpRemoteDataSource);

  @override
  Future<Either<Failure, String>> sendMobileCode(VerifyType verifyType) async {
    try {
      final result = await _otpRemoteDataSource.sendCode(verifyType.toDomain());
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }

  @override
  Future<Either<Failure, String>> activeCode(
    VerifyType verifyType,
    String code,
  ) async {
    try {
      final result =
          await _otpRemoteDataSource.activeCode(verifyType.toDomain(), code);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }
}
