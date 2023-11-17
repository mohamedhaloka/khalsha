import 'package:dartz/dartz.dart';
import 'package:khalsha/features/login/data/models/social_type_enum.dart';
import 'package:khalsha/features/login/domain/repository/login_repository.dart';

import 'package:khalsha/core/data/models/user_data_model.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';

class SocialLoginUseCase extends UseCase<UserData, SocialLoginParams> {
  final LoginRepository _loginRepository;
  SocialLoginUseCase(this._loginRepository);

  @override
  Future<Either<Failure, UserData>> execute(SocialLoginParams params) {
    params.loading(true);
    final call = _loginRepository.socialSignIn(params.type, params.accessToken);
    call.then((_) => params.loading(false));
    return call;
  }
}

class SocialLoginParams extends Params {
  final SocialType type;
  final String accessToken;
  SocialLoginParams({
    required super.loading,
    required this.type,
    required this.accessToken,
  });
}
