import 'package:get/get.dart';
import 'package:khalsha/features/orders/data/models/order_model.dart';
import 'package:khalsha/features/orders/domain/use_cases/get_orders_use_case.dart';

import '../../../../../core/utils.dart';

class OrdersController extends GetxController {
  final GetOrdersUseCase _getOrdersUseCase;
  OrdersController(this._getOrdersUseCase);

  RxInt selectedService = 0.obs;

  List<OrderModel> orders = <OrderModel>[];

  RxBool loading = false.obs;
  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  Future<void> getOrders() async {
    orders.clear();
    final params = GetOrdersParams(loading: loading, type: _type);
    final result = await _getOrdersUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) => orders.addAll(data),
    );
  }

  String get _type {
    switch (selectedService.value) {
      case 0:
        return 'customsclearance';
      case 1:
        return 'warehouses';
      case 2:
        return 'laboratories';
      case 3:
        return 'landshippings';
      case 4:
        return 'seashippings';
      case 5:
        return 'airshippings';
      default:
        return '';
    }
  }
}
