import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';

abstract class ContactUsRepository {
  Future<Either<Failure, String>> sendMessage({
    required String title,
    required String message,
    required String name,
    required String email,
    required String mobile,
  });
}
