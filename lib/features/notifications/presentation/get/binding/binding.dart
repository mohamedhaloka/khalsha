import 'package:get/get.dart';
import 'package:khalsha/features/notifications/presentation/get/controllers/controller.dart';
import 'package:khalsha/injection_container.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.create<NotificationsController>(() => NotificationsController(
          InjectionContainer.sl(),
        ));
  }
}
