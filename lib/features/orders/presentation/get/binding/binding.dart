import 'package:get/get.dart';
import 'package:khalsha/features/orders/presentation/get/controllers/controller.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(() => OrdersController());
  }
}
