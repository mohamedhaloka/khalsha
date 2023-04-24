import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/utils.dart';
import '../../../../orders/domain/entities/order_model.dart';
import '../../../../service_intro/presentation/get/controllers/controller.dart';
import '../../../domain/use_cases/get_my_bills_use_case.dart';

class MyBillsController extends GetxController {
  final GetMyBillsUseCase _getMyBillsUseCase;
  MyBillsController(this._getMyBillsUseCase);

  RxInt selectedService = 0.obs;
  int currentPage = 1;

  RxList<OrderModel> orders = <OrderModel>[].obs;

  RxBool loading = true.obs;

  RefreshController refreshController = RefreshController();
  @override
  void onInit() {
    _getMyBills();
    super.onInit();
  }

  Future<void> _getMyBills() async {
    final params = GetMyBillsParams(
      loading: loading,
      type: ServiceTypes.values[selectedService.value].value,
      pageIndex: currentPage,
      loadingMoreData: false.obs,
    );
    final result = await _getMyBillsUseCase.execute(params);
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

  Future<void> onRefresh() async {
    orders.clear();
    currentPage = 1;
    loading(true);
    await _getMyBills();
    refreshController.refreshCompleted();
  }

  Future<void> onLoading() async {
    currentPage++;
    await _getMyBills();
    refreshController.loadComplete();
  }
}
