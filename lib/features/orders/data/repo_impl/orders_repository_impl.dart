import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/orders/data/data_source/orders_remote_data_source.dart';
import 'package:khalsha/features/orders/domain/entities/order_model.dart';
import 'package:khalsha/features/orders/domain/repository/orders_repository.dart';

class OrdersRepositoryImpl extends BaseRepositoryImpl
    implements OrdersRepository {
  final OrdersRemoteDataSource _ordersRemoteDataSource;
  OrdersRepositoryImpl(this._ordersRemoteDataSource);

  @override
  Future<Either<Failure, List<OrderModel>>> getOrders(
      String type, int page) async {
    return request(() async {
      final result = await _ordersRemoteDataSource.getOrders(type, page);
      return right(result);
    });
  }
}
