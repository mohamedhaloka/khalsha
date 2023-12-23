import 'package:get/get.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/presentation/utils/enums/service_types_enum.dart';
import 'package:khalsha/features/order_details/data/data_source/order_details_remote_data_source.dart';
import 'package:khalsha/features/orders/domain/entities/order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getOrders(String type, int page);
}

class OrdersRemoteDataSourceImpl extends OrdersRemoteDataSource {
  final HttpService _httpService;
  OrdersRemoteDataSourceImpl(this._httpService);

  @override
  Future<List<OrderModel>> getOrders(String type, int page) async {
    final response =
        await _httpService.get('${HttpService.userType}/$type?page=$page');

    if (response.statusCode == 200) {
      final data = response.data['result']['data'];
      List<OrderModel> orders = <OrderModel>[];
      ServiceTypes? serviceTypes = ServiceTypes.values
          .firstWhereOrNull((element) => element.value == type);
      for (var item in data) {
        orders.add(serviceTypes!.getModel(item));
      }
      return orders;
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}
