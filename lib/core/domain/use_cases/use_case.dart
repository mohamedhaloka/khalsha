import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/domain/error/failures.dart';

abstract class UseCase<Out, Params> {
  Future<Either<Failure, Out>> execute(Params params);
}

class Params {
  final RxBool loading;
  const Params({required this.loading});
}

class PaginationParams extends Params {
  final int pageIndex;
  final RxBool loadingMoreData;
  const PaginationParams(
      {required super.loading,
      required this.pageIndex,
      required this.loadingMoreData});
}
