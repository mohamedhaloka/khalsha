import 'package:dartz/dartz.dart';

import '../../../../core/data/models/user_data_model.dart';
import '../../../../core/domain/error/failures.dart';
import '../../data/models/social_type_enum.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserData>> login(String account, String password);

  Future<Either<Failure, UserData>> socialSignIn(
    SocialType type,
    String accessToken,
  );
}
