import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';

import '../../../orders/data/models/order_model.dart';

abstract class OrderDetailsRemoteDataSource {
  Future<OrderModel> getOrderDetails(String type, int id);
}

class OrderDetailsRemoteDataSourceImpl extends OrderDetailsRemoteDataSource {
  final HttpService _httpService;
  OrderDetailsRemoteDataSourceImpl(this._httpService);

  @override
  Future<OrderModel> getOrderDetails(String type, int id) async {
    final response = await _httpService.get('importer/$type/$id');
    if (response.statusCode == 200) {
      return OrderModel.fromJson(response.data['result']);
    } else {
      throw const ServerException();
    }
  }
}
