import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/services/marine_shipping/get/controllers/controller.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../../../../core/data/models/item_model.dart';
import '../../bottom_sheet_content/choose_certificates.dart';
import '../../bottom_sheet_content/choose_shipping_place.dart';
import '../../bottom_sheet_content/set_shipping_details.dart';
import '../../service_content.dart';
import '../../steps/additional_service_step_view.dart';
import '../../steps/confirm_order_step_view.dart';
import '../../steps/fill_data_step_view.dart';
import '../../steps/order_send_successfully_step_view.dart';
import '../../utils.dart';
import '../../widgets/inputs/attach_file_with_holder.dart';
import '../../widgets/inputs/checker_with_holder.dart';
import '../../widgets/inputs/choose_item_with_holder.dart';
import '../../widgets/inputs/text_field_input_with_holder.dart';
import '../../widgets/inputs/toggle_item_with_holder.dart';
import '../../widgets/inputs/twice_text_field_input_with_holder.dart';

class AddEditMarineShippingServiceView
    extends GetView<AddEditMarineShippingServiceController> {
  const AddEditMarineShippingServiceView({Key? key}) : super(key: key);

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

class _FillData extends GetView<AddEditMarineShippingServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceType.marineShipping.value,
      body: Column(
        children: [
          ToggleItemWithHolder(
            title: 'نوع الشحنة',
            items: shippingTypeOptions,
            selectedItem: controller.selectedShippingType,
          ),
          ChooseItemWithHolder(
            title: 'الشحن من',
            bottomSheetTitle: 'الشحن من',
            height: Get.height / 1.6,
            selectedItem: const ItemModel(text: '').obs,
            body: const ChooseShippingPlace(),
          ),
          ChooseItemWithHolder(
            title: 'الشحن إلي',
            bottomSheetTitle: 'الشحن إلي',
            height: Get.height / 1.6,
            selectedItem: const ItemModel(text: '').obs,
            body: const ChooseShippingPlace(),
          ),
          ToggleItemWithHolder(
            title: 'حجم الشحنة',
            items: marineOrderSizeOptions,
            selectedItem: controller.selectedMarineOrderSize,
          ),
          ChooseItemWithHolder(
            title: 'بيانات الشحنة',
            bottomSheetTitle: 'بيانات الشحنة',
            height: Get.height / 1.6,
            selectedItem: const ItemModel(text: '').obs,
            body: const SetShippingDetails(),
          ),
          const TwiceTextFieldInputWithHolder(
            title: 'قيمة الشحنة',
            firstInputHint: '2000',
            firstInputFlex: 2,
            secondInputHint: 'ر.س',
          ),
          const AttachFileWithHolder(
            title: 'صورة للشحنة',
          ),
          const TextFieldInputWithHolder(
            hint: 'وصف الشحنة',
          )
        ],
      ),
    );
  }
}

class _AdditionalServices
    extends GetView<AddEditMarineShippingServiceController> {
  const _AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Column(
        children: [
          CheckerWithHolder(
            title: 'خدمة التأمين',
            active: true.obs,
          ),
          CheckerWithHolder(
            title: 'خدمة التخليص الجمركي',
            active: true.obs,
          ),
          CheckerWithHolder(
            title: 'المساعدة في إستخراج الشهادات',
            active: false.obs,
            bottomSheetTitle: 'الشهادات',
            body: const ChooseCertificates(),
            height: Get.height / 1.6,
          ),
        ],
      ),
    );
  }
}
