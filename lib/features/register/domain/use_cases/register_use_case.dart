import 'package:dartz/dartz.dart';
import 'package:khalsha/features/register/domain/repository/register_repository.dart';

import 'package:khalsha/core/data/models/user_data_model.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';

class RegisterUseCase extends UseCase<UserData, RegisterParams> {
  final RegisterRepository _registerRepository;
  RegisterUseCase(this._registerRepository);

  @override
  Future<Either<Failure, UserData>> execute(RegisterParams params) {
    params.loading(true);
    final call = _registerRepository.register(
      name: params.name,
      email: params.email,
      password: params.password,
      passwordConfirmation: params.passwordConfirmation,
      phone: params.phone,
      userType: params.userType,
      commercialCertificate: params.commercialCertificate,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class RegisterParams extends Params {
  final String name,
      email,
      password,
      passwordConfirmation,
      phone,
      userType,
      commercialCertificate;
  RegisterParams({
    required super.loading,
    required this.name,
    required this.email,
    required this.passwordConfirmation,
    required this.password,
    required this.userType,
    required this.phone,
    required this.commercialCertificate,
  });
}
