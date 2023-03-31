import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/otp/domain/entites/enums/verify_type.dart';
import 'package:khalsha/features/otp/domain/repository/otp_repository.dart';

class SendCodeUseCase extends UseCase<String, SendCodeParams> {
  final OTPRepository _otpRepository;
  SendCodeUseCase(this._otpRepository);

  @override
  Future<Either<Failure, String>> execute(SendCodeParams params) async {
    params.loading(true);
    final call = _otpRepository.sendMobileCode(params.verifyType);
    call.then((_) => params.loading(false));
    return call;
  }
}

class SendCodeParams extends Params {
  final VerifyType verifyType;
  SendCodeParams({
    required super.loading,
    required this.verifyType,
  });
}
