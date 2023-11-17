import 'package:dartz/dartz.dart';

import 'package:khalsha/core/data/models/user_data_model.dart';
import 'package:khalsha/core/domain/error/failures.dart';

abstract class RootRepository {
  Future<Either<Failure, UserData>> refreshToken();
  Future<Either<Failure, String>> logOut();
  Future<Either<Failure, String>> updateFCMToken(String fcmToken);
}
