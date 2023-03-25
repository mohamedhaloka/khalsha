import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/routes/app_routes.dart';
import 'package:khalsha/features/fill_service_details/presentation/steps/fill_data/fill_data_step_view.dart';
import 'package:khalsha/features/fill_service_details/presentation/steps/order_send_successfully_step_view.dart';
import 'package:khalsha/features/fill_service_details/presentation/steps/pick_locations_step_view.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../../../../core/models/item_model.dart';
import '../../steps/additional_service/additional_service_step_view.dart';
import '../../steps/attach_files_step_view.dart';
import '../../steps/confirm_order_step_view.dart';

class FillServiceDetailsController extends GetxController {
  ServiceType serviceType = Get.arguments;

  PageController stepsPageController = PageController();

  RxInt currentStep = 0.obs;
  RxList<ItemModel> pages = <ItemModel>[
    const ItemModel(
      text: 'تعبئة الطلب',
      child: FillDataStepView(),
    ),
    const ItemModel(
      text: 'خدمات إضافية',
      child: AdditionalServiceStepView(),
    ),
    const ItemModel(
      text: 'تأكيد الطلب',
      child: ConfirmOrderStepView(),
    ),
    const ItemModel(
      text: 'إرسال الطلب',
      child: OrderSendSuccessfullyStepView(),
    ),
  ].obs;

  String get pageTitle => pages[currentStep.value].text;

  @override
  void onReady() {
    _addAdditionalPage();
    super.onReady();
  }

  void _addAdditionalPage() {
    ItemModel? page;
    switch (serviceType) {
      case ServiceType.customsClearance:
        page = const ItemModel(
          text: 'إرفاق ملفات',
          child: AttachFilesStepView(),
        );
        break;
      case ServiceType.landShipping:
        page = const ItemModel(
          text: 'تحديد الموقع و التوقيت',
          child: PickLocationsStepView(),
        );
        break;
      default:
        break;
    }
    if (page == null) return;
    pages.insert(2, page);
  }

  void goNext() {
    if (currentStep.value == pages.length - 1) {
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
