import 'package:get/get.dart';
import 'package:khalsha/injection_container.dart';

import 'package:khalsha/features/blog/presentation/get/controllers/controller.dart';

class BlogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BlogController>(() => BlogController(
          InjectionContainer.sl(),
          InjectionContainer.sl(),
          InjectionContainer.sl(),
        ));
  }
}
