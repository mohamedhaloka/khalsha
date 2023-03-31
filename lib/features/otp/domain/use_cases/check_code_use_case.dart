import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/otp/domain/repository/otp_repository.dart';

import '../entites/enums/verify_type.dart';

class CheckCodeUseCase extends UseCase<String, CheckCodeParams> {
  final OTPRepository _otpRepository;
  CheckCodeUseCase(this._otpRepository);

  @override
  Future<Either<Failure, String>> execute(CheckCodeParams params) async {
    params.loading(true);
    final call = _otpRepository.activeCode(params.verifyType, params.code);
    call.then((_) => params.loading(false));
    return call;
  }
}

class CheckCodeParams extends Params {
  final String code;
  final VerifyType verifyType;

  CheckCodeParams({
    required super.loading,
    required this.verifyType,
    required this.code,
  });
}
