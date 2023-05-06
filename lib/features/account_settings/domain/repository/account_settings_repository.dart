import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';

abstract class AccountSettingsRepository {
  Future<Either<Failure, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  });
}
