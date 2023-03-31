import 'package:dartz/dartz.dart';

import '../../../../core/data/models/user_data_model.dart';
import '../../../../core/domain/error/failures.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserData>> login(String account, String password);
}
