import 'package:khalsha/core/data/services/http_service.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../models/order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getOrders(String type);
}

class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource {
  final HttpService _httpService;
  OrdersRemoteDataSourceImpl(this._httpService);

  @override
  Future<List<OrderModel>> getOrders(String type) async {
    final response = await _httpService.get('importer/customsclearance');

    if (response.statusCode == 200) {
      final data = response.data['result']['data'];
      List<OrderModel> orders = <OrderModel>[];

      for (var item in data) {
        orders.add(OrderModel.fromJson(item));
      }
      return orders;
    } else {
      throw ServerException(errorMessage: response.data.toString());
    }
  }
}
