import 'package:get/get.dart';
import 'package:khalsha/features/home/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/my_bills/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/notifications/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/orders/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/profile/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/settlement/presentation/get/controllers/controller.dart';
import 'package:khalsha/injection_container.dart';

import '../controllers/controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController(
          InjectionContainer.sl(),
          InjectionContainer.sl(),
        ));
    Get.lazyPut<SettlementController>(
        () => SettlementController(InjectionContainer.sl()));
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(
        () => ProfileController(InjectionContainer.sl()));
    Get.lazyPut<NotificationsController>(() => NotificationsController());
    Get.lazyPut<OrdersController>(
        () => OrdersController(InjectionContainer.sl()));
    Get.lazyPut<MyBillsController>(
        () => MyBillsController(InjectionContainer.sl()));
  }
}
