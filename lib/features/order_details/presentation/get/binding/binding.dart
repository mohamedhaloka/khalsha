import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import 'package:khalsha/features/order_details/presentation/view.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(() => OrderDetailsController(
          InjectionContainer.sl(),
          InjectionContainer.sl(),
          InjectionContainer.sl(),
          InjectionContainer.sl(),
          InjectionContainer.sl(),
          InjectionContainer.sl(),
        ));
  }
}
