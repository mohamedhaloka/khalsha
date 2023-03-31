import 'package:dartz/dartz.dart';

import '../../../../core/data/models/user_data_model.dart';
import '../../../../core/domain/error/failures.dart';

abstract class RegisterRepository {
  Future<Either<Failure, UserData>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phone,
    required String userType,
    required String commercialCertificate,
  });
}
