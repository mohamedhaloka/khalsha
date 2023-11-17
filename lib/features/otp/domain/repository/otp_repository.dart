import 'package:dartz/dartz.dart';
import 'package:khalsha/features/otp/domain/entites/enums/verify_type.dart';

import 'package:khalsha/core/domain/error/failures.dart';

abstract class OTPRepository {
  Future<Either<Failure, String>> sendMobileCode(VerifyType verifyType);

  Future<Either<Failure, String>> activeCode(
    VerifyType verifyType,
    String code,
  );
}
