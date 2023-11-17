import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/my_bills/data/data_source/my_bills_remote_data_source.dart';
import 'package:khalsha/features/my_bills/domain/repository/my_bills_repository.dart';
import 'package:khalsha/features/orders/domain/entities/order_model.dart';

class MyBillsRepositoryImpl extends BaseRepositoryImpl
    implements MyBillsRepository {
  final MyBillsRemoteDataSource _remoteDataSource;
  MyBillsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<OrderModel>>> getBills(
      {required String type, required int pageIndex}) async {
    return request(() async {
      final result = await _remoteDataSource.getBills(type, pageIndex);
      return right(result);
    });
  }
}
