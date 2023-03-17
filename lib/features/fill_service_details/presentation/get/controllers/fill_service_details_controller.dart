import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/steps/fill_data_step_view.dart';
import 'package:khalsha/features/fill_service_details/presentation/steps/order_send_successfully_step_view.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../../../../core/models/item_model.dart';
import '../../steps/additional_service_step_view.dart';
import '../../steps/attach_files_step_view.dart';
import '../../steps/confirm_order_step_view.dart';

class FillServiceDetailsController extends GetxController {
  ServiceType serviceType = Get.arguments;

  PageController stepsPageController = PageController();

  RxInt currentStep = 0.obs;
  List<ItemModel> pages = const <ItemModel>[
    ItemModel(
      text: 'تعبئة الطلب',
      child: FillDataView(),
    ),
    ItemModel(
      text: 'خدمات إضافية',
      child: AdditionalServiceStepView(),
    ),
    ItemModel(
      text: 'إرفاق ملفات',
      child: AttachFilesStepView(),
    ),
    ItemModel(
      text: 'تأكيد الطلب',
      child: ConfirmOrderStepView(),
    ),
    ItemModel(
      text: 'إرسال الطلب',
      child: OrderSendSuccessfullyStepView(),
    ),
  ];

  String get pageTitle => pages[currentStep.value].text;

  void goNext() {
    if (currentStep.value == pages.length - 1) {
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
