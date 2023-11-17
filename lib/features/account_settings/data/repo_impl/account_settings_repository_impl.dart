import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/account_settings/data/data_source/account_settings_remote_data_source.dart';
import 'package:khalsha/features/account_settings/domain/repository/account_settings_repository.dart';

class AccountSettingsRepositoryImpl extends BaseRepositoryImpl
    implements AccountSettingsRepository {
  final AccountSettingsRemoteDataSource _accountSettingsRemoteDataSource;
  AccountSettingsRepositoryImpl(this._accountSettingsRemoteDataSource);

  @override
  Future<Either<Failure, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    return request(() async {
      final result = await _accountSettingsRemoteDataSource.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
        confirmNewPassword: confirmNewPassword,
      );
      return right(result);
    });
  }

  @override
  Future<Either<Failure, String>> updateAccount({
    required String name,
    required String email,
    required String mobile,
    required String commercialCert,
    required String bio,
  }) async {
    return request(() async {
      final result = await _accountSettingsRemoteDataSource.updateAccount(
        name: name,
        email: email,
        mobile: mobile,
        commercialCert: commercialCert,
        bio: bio,
      );
      return right(result);
    });
  }

  @override
  Future<Either<Failure, String>> uploadProfilePhoto(
      {required String imagePath}) async {
    return request(() async {
      final result = await _accountSettingsRemoteDataSource.uploadProfilePhoto(
        imagePath: imagePath,
      );
      return right(result);
    });
  }
}
