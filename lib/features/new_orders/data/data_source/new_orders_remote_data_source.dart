import 'package:khalsha/core/data/services/http_service.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../models/new_order_model.dart';

abstract class NewOrdersRemoteDataSource {
  Future<List<NewOrderModel>> getNewOrders(String type);
}

class NewOrdersRemoteDataSourceImpl extends NewOrdersRemoteDataSource {
  final HttpService _httpService;
  NewOrdersRemoteDataSourceImpl(this._httpService);

  @override
  Future<List<NewOrderModel>> getNewOrders(String type) async {
    final response = await _httpService.get('provider/new_requests?type=$type');

    if (response.statusCode == 200) {
      final data = response.data['data']['requests']['data'];
      List<NewOrderModel> orders = <NewOrderModel>[];

      for (var item in data) {
        orders.add(NewOrderModel.fromJson(item));
      }
      return orders;
    } else {
      throw ServerException(errorMessage: response.data.toString());
    }
  }
}
