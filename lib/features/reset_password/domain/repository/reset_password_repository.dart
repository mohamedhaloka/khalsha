import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';

abstract class ResetPasswordRepository {
  Future<Either<Failure, String>> resetPassword(
    String account,
    String code,
    String password,
    String confirmationPassword,
  );
}
