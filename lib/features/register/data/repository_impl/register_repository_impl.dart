import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/features/register/data/source/register_remote_data_source.dart';
import 'package:khalsha/features/register/domain/repository/register_repository.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';

import '../../../../core/data/models/user_data_model.dart';
import '../../../../core/domain/error/exceptions.dart';
import '../../../../core/domain/error/failures.dart';

class RegisterRepositoryImpl extends RegisterRepository {
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
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }
}
