import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';

typedef FutureEitherFailureOrData<T> = Future<Either<Failure, T>> Function();

abstract class BaseRepository {
  Future<Either<Failure, T>> request<T>(FutureEitherFailureOrData<T> body);
}
