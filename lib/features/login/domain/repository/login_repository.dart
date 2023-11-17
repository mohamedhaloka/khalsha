import 'package:dartz/dartz.dart';

import 'package:khalsha/core/data/models/user_data_model.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/login/data/models/social_type_enum.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserData>> login(String account, String password);

  Future<Either<Failure, UserData>> socialSignIn(
    SocialType type,
    String accessToken,
  );
}
