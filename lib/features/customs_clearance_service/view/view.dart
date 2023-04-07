import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/item_model.dart';
import 'package:khalsha/features/customs_clearance_service/view/steps/attach_files_step_view.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';

import '../../../core/service_utils.dart';
import '../../widgets/bottom_sheet_content/customs_clause.dart';
import '../../widgets/bottom_sheet_content/multi_items_list.dart';
import '../../widgets/bottom_sheet_content/set_number_count.dart';
import '../../widgets/inputs/choose_item_with_holder.dart';
import '../../widgets/inputs/service_item_with_holder.dart';
import '../../widgets/inputs/text_field_input_with_drop_down_with_holder.dart';
import '../../widgets/inputs/text_field_input_with_holder.dart';
import '../../widgets/inputs/toggle_item_with_holder.dart';
import '../../widgets/service_content.dart';
import '../../widgets/steps/additional_service_step_view.dart';
import '../../widgets/steps/fill_data_step_view.dart';
import '../../widgets/steps/order_send_successfully_step_view.dart';
import 'bottom_sheets/add_container_sheet.dart';
import 'bottom_sheets/add_parcel_sheet.dart';
import 'get/controllers/controller.dart';

class AddEditCustomsClearanceServiceView
    extends GetView<AddEditCustomsClearanceController> {
  const AddEditCustomsClearanceServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ServiceContent(
          onTapBack: controller.onTapBack,
          onPageChanged: controller.onPageChanged,
          pageViewController: controller.pageController,
          pageTitle: controller.pageTitle,
          onTapNext: controller.onTapNext,
          nextTitle: controller.btnTxt,
          currentStep: controller.currentStep,
          btnLoading: controller.loading,
          children: const [
            _FillData(),
            _AdditionalServices(),
            AttachFilesStepView(),
            OrderSendSuccessfullyStepView(),
          ],
        ));
  }
}

class _FillData extends GetView<AddEditCustomsClearanceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceType.customsClearance.value,
      body: Column(
        children: [
          TextFieldInputWithHolder(
            title: 'عنوان الطلب',
            controller: controller.name,
          ),
          ToggleItemWithHolder(
            title: 'مجال الشحنة',
            items: shippingFieldOptions,
            selectedItem: controller.selectedShippingField,
          ),
          ToggleItemWithHolder(
            title: 'نوع الشحنة',
            items: shippingTypeOptions,
            selectedItem: controller.selectedShippingType,
          ),
          ChooseItemWithHolder(
            title: 'منفذ الشحنة',
            selectedItem: controller.selectedShippingPort,
            bottomSheetTitle: 'اختر منفذ الشحنة',
            height: Get.height / 2,
            body: MultiItemsList(
              items: controller.shippingPorts,
              selectedItem: controller.selectedShippingPort,
            ),
          ),
          TextFieldInputWithHolder(
            title: 'التوصيل إلي',
            controller: controller.deliverTo,
          ),
          TextFieldInputWithHolder(
            hint: 'وصف البضاعة',
            controller: controller.description,
          ),
          TextFieldInputWithDropDownWithHolder(
            title: 'الإجمالي',
            firstInputHint: 'السعر',
            firstInputFlex: 2,
            secondInputHint: 'العملة',
            firstInputController: controller.total,
            selectedDropDownValue: controller.selectedCurrency,
            source: ['دولار أمريكي', 'ريال سعودي']
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
          ),
          ToggleItemWithHolder(
            title: 'نوع الشحن',
            items: shipTypeOptions,
            selectedItem: controller.selectedShippingMethod,
            onChooseItem: (ItemModel item) {
              late Widget bottomSheetBody;
              if (item.id == 0) {
                bottomSheetBody = const ParcelSheetBody();
              } else {
                bottomSheetBody = const ContainerSheetBody();
              }
              Get.bottomSheet(
                  HeadLineBottomSheet(
                    bottomSheetTitle: item.text,
                    body: bottomSheetBody,
                    height: Get.height / 1.2,
                  ),
                  isScrollControlled: true);
            },
          ),
        ],
      ),
    );
  }
}

class _AdditionalServices extends GetView<AddEditCustomsClearanceController> {
  const _AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Column(
        children: [
          ServiceItemWithHolder(
            title: 'هل تريد التخزين',
            bottomSheetTitle: 'خدمة التخزين',
            height: Get.height / 3,
            body: SetNumberCount(
              number: controller.numberOfStorage,
              title: 'عدد أيام التخزين',
            ),
          ),
          ServiceItemWithHolder(
            title: 'هل يوجد بند جمركي',
            bottomSheetTitle: 'إضافة بند جمركي',
            height: Get.height / 2,
            body: CustomsClause(
              customsClause: controller.customsClauseList,
            ),
          ),
        ],
      ),
    );
  }
}
