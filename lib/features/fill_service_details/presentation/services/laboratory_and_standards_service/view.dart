import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../service_content.dart';
import '../../steps/additional_service_step_view.dart';
import '../../steps/confirm_order_step_view.dart';
import '../../steps/fill_data_step_view.dart';
import '../../steps/order_send_successfully_step_view.dart';
import '../../widgets/inputs/checker_with_holder.dart';
import '../../widgets/inputs/service_item_with_holder.dart';
import '../../widgets/inputs/text_field_input_with_holder.dart';
import 'get/controllers/controller.dart';

class AddEditLaboratoryAndStandardsServiceView
    extends GetView<AddEditLaboratoryAndStandardsServiceController> {
  const AddEditLaboratoryAndStandardsServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ServiceContent(
      onTapBack: controller.onTapBack,
      onPageChanged: controller.onPageChanged,
      pageViewController: controller.pageController,
      pageTitle: controller.pageTitle,
      onTapNext: controller.onTapNext,
      children: const [
        _FillData(),
        _AdditionalServices(),
        ConfirmOrderStepView(),
        OrderSendSuccessfullyStepView(),
      ],
    );
  }
}

class _FillData
    extends GetView<AddEditLaboratoryAndStandardsServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceType.laboratoryAndStandards.value,
      body: Column(
        children: [
          ServiceItemWithHolder(
            title: 'متوفر لدي المورد Factory aduit report',
            bottomSheetTitle: 'خدمة التخزين',
            height: Get.height / 3,
            onTap: () {},
            body: const Text('lll'),
          ),
          ServiceItemWithHolder(
            title: 'متوفر لدي المورد Test report',
            bottomSheetTitle: 'خدمة التخزين',
            height: Get.height / 3,
            onTap: () {},
            body: const Text('lll'),
          ),
          const TextFieldInputWithHolder(
            hint: 'ملاحظات',
          ),
        ],
      ),
    );
  }
}

class _AdditionalServices
    extends GetView<AddEditLaboratoryAndStandardsServiceController> {
  const _AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Column(
        children: [
          CheckerWithHolder(
            title: 'هل تحتاج المساعدة في تقديم الشهادات المطلوبة لهذه الشحنة',
            active: false.obs,
          ),
        ],
      ),
    );
  }
}
