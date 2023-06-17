import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/features/login/data/models/social_type_enum.dart';
import 'package:khalsha/features/login/data/source/login_remote_data_source.dart';
import 'package:khalsha/features/login/domain/repository/login_repository.dart';

import '../../../../core/data/models/user_data_model.dart';
import '../../../../core/domain/error/exceptions.dart';
import '../../../../core/domain/error/failures.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;
  LoginRepositoryImpl(this._loginRemoteDataSource);

  @override
  Future<Either<Failure, UserData>> login(
      String account, String password) async {
    try {
      final result = await _loginRemoteDataSource.login(account, password);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.data.toString()));
    }
  }

  @override
  Future<Either<Failure, UserData>> socialSignIn(
      SocialType type, String accessToken) async {
    try {
      final result =
          await _loginRemoteDataSource.socialSignIn(type, accessToken);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.data.toString()));
    }
  }
}
