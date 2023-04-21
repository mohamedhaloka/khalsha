import 'package:get/get.dart';
import 'package:khalsha/features/orders/domain/use_cases/get_orders_use_case.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../../../../core/presentation/routes/app_routes.dart';
import '../../../../../core/utils.dart';
import '../../../domain/entities/order_model.dart';

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
    final params = GetOrdersParams(
      loading: loading,
      type: ServiceTypes.values[selectedService.value].value,
    );
    final result = await _getOrdersUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) => orders.addAll(data),
    );
  }

  String get route {
    switch (selectedService.value) {
      case 0:
        return Routes.customsClearanceService;
      case 1:
        return Routes.personalDomesticLandShipping;
      case 2:
        return Routes.stores;
      case 3:
        return Routes.marineShipping;
      case 4:
        return Routes.airFreight;
      case 5:
        return Routes.laboratoryAndStandardsService;
      default:
        return '';
    }
  }

  Future<void> onRefresh() async {
    orders.clear();
    getOrders();
  }
}
