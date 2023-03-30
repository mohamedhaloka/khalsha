import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../bottom_sheet_content/multi_items_list.dart';
import '../../service_content.dart';
import '../../steps/additional_service_step_view.dart';
import '../../steps/confirm_order_step_view.dart';
import '../../steps/fill_data_step_view.dart';
import '../../steps/order_send_successfully_step_view.dart';
import '../../utils.dart';
import '../../widgets/inputs/checker_with_holder.dart';
import '../../widgets/inputs/choose_item_with_holder.dart';
import '../../widgets/inputs/text_field_input_with_holder.dart';
import '../../widgets/inputs/toggle_item_with_holder.dart';
import 'get/controllers/controller.dart';

class AddEditStoresServiceView extends GetView<AddEditStoresServiceController> {
  const AddEditStoresServiceView({Key? key}) : super(key: key);

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

class _FillData extends GetView<AddEditStoresServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: '',
      body: Column(
        children: [
          ToggleItemWithHolder(
            title: 'الغرض من التخزين',
            items: shippingFieldOptions,
            selectedItem: controller.selectedShippingField,
          ),
          ChooseItemWithHolder(
            title: 'نوع التخزين',
            selectedItem: controller.selectedShippingPlace,
            bottomSheetTitle: 'نوع التخزين',
            height: Get.height / 2,
            body: MultiItemsList(
              items: testItemsList,
              selectedItem: controller.selectedShippingPlace,
            ),
          ),
          ChooseItemWithHolder(
            title: 'نوع الصنف',
            selectedItem: controller.selectedShippingPlace,
            bottomSheetTitle: 'نوع الصنف',
            height: Get.height / 2,
            body: MultiItemsList(
              items: testItemsList,
              selectedItem: controller.selectedShippingPlace,
            ),
          ),
          ToggleItemWithHolder(
            title: 'حجم الشحنة',
            items: storesOrderSizeOptions,
            selectedItem: controller.selectedStoresOrderSize,
          ),
          ChooseItemWithHolder(
            title: 'المدينة/الدولة',
            selectedItem: controller.selectedShippingPlace,
            bottomSheetTitle: 'اختر منفذ الشحنة',
            height: Get.height / 2,
            body: MultiItemsList(
              items: testItemsList,
              selectedItem: controller.selectedShippingPlace,
            ),
          ),
          const TextFieldInputWithHolder(
            hint: 'وصف الشحنة',
          ),
        ],
      ),
    );
  }
}

class _AdditionalServices extends GetView<AddEditStoresServiceController> {
  const _AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Column(
        children: [
          CheckerWithHolder(
            title: 'هل تريد خدمة التغليف',
            active: false.obs,
          ),
          CheckerWithHolder(
            title: 'المساعدة بتسجيل المنتجات بالهيئة',
            active: false.obs,
          ),
          CheckerWithHolder(
            title: 'المساعة في إستخراج تراخيص الشركات و المؤسسات للاستيراد',
            active: true.obs,
          ),
          CheckerWithHolder(
            title: 'المساعة في إجراءات وزارة الزراعة',
            active: false.obs,
          ),
        ],
      ),
    );
  }
}
