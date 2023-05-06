import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/account_settings/domain/repository/account_settings_repository.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../data_source/account_settings_remote_data_source.dart';

class AccountSettingsRepositoryImpl extends AccountSettingsRepository {
  final AccountSettingsRemoteDataSource _accountSettingsRemoteDataSource;
  AccountSettingsRepositoryImpl(this._accountSettingsRemoteDataSource);

  @override
  Future<Either<Failure, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      final result = await _accountSettingsRemoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword,
      );
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: json.encode(e.response!.data)));
    }
  }
}
