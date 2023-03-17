import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

import '../get/controllers/fill_service_details_controller.dart';

class StepsProgressIndicator extends GetView<FillServiceDetailsController> {
  const StepsProgressIndicator({Key? key}) : super(key: key);

  double get progressWidth => (Get.width *
      ((controller.currentStep.value + 1) / controller.pages.length));

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Obx(() => AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: progressWidth,
            height: 1.5,
            color: ColorManager.secondaryColor,
          )),
    );
  }
}
