import 'package:dartz/dartz.dart';

import 'package:khalsha/core/domain/error/failures.dart';

abstract class AccountSettingsRepository {
  Future<Either<Failure, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  });

  Future<Either<Failure, String>> updateAccount({
    required String name,
    required String email,
    required String mobile,
    required String commercialCert,
    required String bio,
  });

  Future<Either<Failure, String>> uploadProfilePhoto(
      {required String imagePath});
}
