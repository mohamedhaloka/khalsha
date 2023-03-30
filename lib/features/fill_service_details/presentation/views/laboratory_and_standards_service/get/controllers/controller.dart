import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../get/controllers/add_edit_service_controller.dart';

class AddEditLaboratoryAndStandardsServiceController extends GetxController {
  final _addEditServiceController = Get.find<AddEditServiceController>();

  PageController get pageController =>
      _addEditServiceController.stepsPageController;

  String get pageTitle {
    switch (_addEditServiceController.currentStep.value) {
      case 0:
        return 'تعبئة الطلب';
      case 1:
        return 'خدمات إضافية';
      case 2:
        return 'تأكيد الطلب';
      case 3:
        return 'إرسال الطلب';
    }
    return '';
  }

  RxInt get currentStep => _addEditServiceController.currentStep;

  void onPageChanged(int index) =>
      _addEditServiceController.onPageChanged(index);
  void onTapBack() => _addEditServiceController.goBack();
  void onTapNext() => _addEditServiceController.goNext();
}
