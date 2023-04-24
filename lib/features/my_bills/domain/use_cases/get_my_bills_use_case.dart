import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/my_bills/domain/repository/my_bills_repository.dart';

import '../../../orders/domain/entities/order_model.dart';

class GetMyBillsUseCase extends UseCase<List<OrderModel>, GetMyBillsParams> {
  final MyBillsRepository _myBillsRepository;
  GetMyBillsUseCase(this._myBillsRepository);

  @override
  Future<Either<Failure, List<OrderModel>>> execute(params) async {
    final call = _myBillsRepository.getBills(
      type: params.type,
      pageIndex: params.pageIndex,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class GetMyBillsParams extends PaginationParams {
  final String type;
  GetMyBillsParams({
    required super.loading,
    required this.type,
    required super.pageIndex,
    required super.loadingMoreData,
  });
}
