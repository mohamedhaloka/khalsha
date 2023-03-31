import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../get/controllers/add_edit_service_controller.dart';

class StepsProgressIndicator extends GetView<AddEditServiceController> {
  const StepsProgressIndicator({
    Key? key,
    required this.pagesLength,
  }) : super(key: key);
  final int pagesLength;

  double get progressWidth =>
      (Get.width * ((controller.currentStep.value + 1) / pagesLength));

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: progressWidth,
          height: 1.5,
          color: ColorManager.secondaryColor,
        ),
      ),
    );
  }
}
