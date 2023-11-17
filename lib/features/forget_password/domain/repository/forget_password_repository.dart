import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';

abstract class ForgetPasswordRepository {
  Future<Either<Failure, String>> forgetPassword(String account);
}
