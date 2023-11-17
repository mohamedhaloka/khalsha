import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/data/models/user_data_model.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/utils/constants.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';
import 'package:khalsha/features/register/data/source/register_remote_data_source.dart';
import 'package:khalsha/features/register/domain/repository/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource _registerRemoteDataSource;
  RegisterRepositoryImpl(this._registerRemoteDataSource);

  @override
  Future<Either<Failure, UserData>> register(
      {required String name,
      required String email,
      required String password,
      required String passwordConfirmation,
      required String phone,
      required String userType,
      required String commercialCertificate}) async {
    try {
      final result = await _registerRemoteDataSource.register(
        name,
        email,
        password,
        passwordConfirmation,
        phone,
        userType,
        commercialCertificate,
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
