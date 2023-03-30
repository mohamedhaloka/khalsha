import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/routes/app_routes.dart';

class AddEditServiceController extends GetxController {
  PageController stepsPageController = PageController();

  RxInt currentStep = 0.obs;
  //
  // void _addAdditionalPage() {
  //   ItemModel? page;
  //   switch (serviceType) {
  //     case ServiceType.customsClearance:
  //       page = const ItemModel(
  //         text: 'إرفاق ملفات',
  //         child: AttachFilesStepView(),
  //       );
  //       break;
  //     case ServiceType.landShipping:
  //       page = const ItemModel(
  //         text: 'تحديد الموقع و التوقيت',
  //         child: PickLocationsStepView(),
  //       );
  //       break;
  //     default:
  //       break;
  //   }
  //   if (page == null) return;
  //   pages.insert(2, page);
  // }

  void onPageChanged(int index) => currentStep(index);

  void goNext([int totalSteps = 3]) {
    if (currentStep.value == totalSteps) {
      Get.offAllNamed(Routes.navigationMenu);
      return;
    }
    _nextPage();
  }

  void goBack() {
    if (currentStep.value == 0) {
      Get.back();
      return;
    }
    _previousPage();
  }

  void _nextPage() {
    stepsPageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    stepsPageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
