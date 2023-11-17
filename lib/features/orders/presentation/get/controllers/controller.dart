import 'package:get/get.dart';
import 'package:khalsha/features/orders/domain/use_cases/get_orders_use_case.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/utils.dart';
import 'package:khalsha/features/orders/domain/entities/order_model.dart';

class OrdersController extends GetxController {
  final GetOrdersUseCase _getOrdersUseCase;
  OrdersController(
    this._getOrdersUseCase,
  );

  RxInt selectedService = 0.obs;
  int currentPage = 1;

  RxList<OrderModel> orders = <OrderModel>[].obs;

  RxBool loading = true.obs;

  RefreshController refreshController = RefreshController();
  @override
  void onInit() {
    _getOrders();
    super.onInit();
  }

  Future<void> _getOrders() async {
    final params = GetOrdersParams(
      loading: loading,
      type: ServiceTypes.values[selectedService.value].value,
      pageIndex: currentPage,
      loadingMoreData: false.obs,
    );
    final result = await _getOrdersUseCase.execute(params);
    result.fold(
      (failure) {
        showAlertMessage(failure.statusMessage);
        currentPage = currentPage - 1;
      },
      (data) {
        if (data.isEmpty) {
          currentPage = currentPage - 1;
          return;
        }
        orders.addAll(data);
      },
    );
  }

  String get route {
    switch (selectedService.value) {
      case 0:
        return Routes.customsClearanceService;
      case 1:
        return Routes.landShipping;
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
    currentPage = 1;
    loading(true);
    await _getOrders();
    refreshController.refreshCompleted();
  }

  Future<void> onLoading() async {
    currentPage++;
    await _getOrders();
    refreshController.loadComplete();
  }
}
