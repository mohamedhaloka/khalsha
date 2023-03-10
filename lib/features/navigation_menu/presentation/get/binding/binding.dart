import 'package:get/get.dart';
import 'package:khalsha/features/home/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/notifications/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/orders/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/profile/presentation/get/controllers/controller.dart';

import '../controllers/controller.dart';

class NavigationMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationMenuController>(() => NavigationMenuController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<NotificationsController>(() => NotificationsController());
    Get.lazyPut<OrdersController>(() => OrdersController());
  }
}
