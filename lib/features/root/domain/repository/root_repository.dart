import 'package:dartz/dartz.dart';

import '../../../../core/data/models/user_data_model.dart';
import '../../../../core/domain/error/failures.dart';

abstract class RootRepository {
  Future<Either<Failure, UserData>> refreshToken();
  Future<Either<Failure, String>> logOut();
}
