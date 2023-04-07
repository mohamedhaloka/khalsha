import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors_manager.dart';

class StepsProgressIndicator extends StatelessWidget {
  const StepsProgressIndicator({
    Key? key,
    required this.pagesLength,
    required this.currentStep,
  }) : super(key: key);
  final int pagesLength;
  final RxInt currentStep;

  double get progressWidth =>
      (Get.width * ((currentStep.value + 1) / pagesLength));

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
