import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/fill_service_details_controller.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/steps_progress_indicator.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';

class FillServiceDetailsView extends GetView<FillServiceDetailsController> {
  const FillServiceDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bgColor,
      appBar: const DynamicServiceAppBar(),
      body: Column(
        children: [
          const StepsProgressIndicator(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(() => PageView.builder(
                    controller: controller.stepsPageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, int index) =>
                        controller.pages[index].child!,
                    onPageChanged: (int index) => controller.currentStep(index),
                    itemCount: controller.pages.length,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: CustomButton(
              onTap: controller.goNext,
              width: Get.width,
              height: 60,
              text: 'التالي',
            ),
          )
        ],
      ),
    );
  }
}

class DynamicServiceAppBar extends GetView<FillServiceDetailsController>
    with PreferredSizeWidget {
  const DynamicServiceAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomAppBar(
        title: controller.pageTitle,
        backgroundColor: ColorManager.bgColor,
        onTap: controller.goBack,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
