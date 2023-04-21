import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../core/service_utils.dart';
import '../widgets/bottom_sheet_content/add_notes_sheet.dart';
import '../widgets/bottom_sheet_content/add_shipping_size.dart';
import '../widgets/bottom_sheet_content/choose_certificates.dart';
import '../widgets/bottom_sheet_content/multi_items_list.dart';
import '../widgets/headline_bottom_sheet.dart';
import '../widgets/inputs/attach_file_with_holder.dart';
import '../widgets/inputs/checker_with_holder.dart';
import '../widgets/inputs/choose_item_with_holder.dart';
import '../widgets/inputs/text_field_input_with_drop_down_with_holder.dart';
import '../widgets/inputs/text_field_input_with_holder.dart';
import '../widgets/inputs/toggle_item_with_holder.dart';
import '../widgets/service_content.dart';
import '../widgets/steps/additional_service_step_view.dart';
import '../widgets/steps/confirm_order_step_view.dart';
import '../widgets/steps/fill_data_step_view.dart';
import '../widgets/steps/order_send_successfully_step_view.dart';
import 'get/controllers/controller.dart';

class AddEditAirFreightServiceView
    extends GetView<AddEditAirFreightServiceController> {
  const AddEditAirFreightServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ServiceContent(
      onTapBack: controller.onTapBack,
      onPageChanged: controller.onPageChanged,
      pageViewController: controller.pageController,
      pageTitle: controller.pageTitle,
      onTapNext: controller.onTapNext,
      btnLoading: false.obs,
      currentStep: controller.currentStep,
      children: const [
        _FillData(),
        _AdditionalServices(),
        ConfirmOrderStepView(),
        OrderSendSuccessfullyStepView(),
      ],
    );
  }
}

class _FillData extends GetView<AddEditAirFreightServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceTypes.airFreight.value,
      body: Column(
        children: [
          ToggleItemWithHolder(
            title: 'مجال الشحنة',
            items: shippingTypeOptions,
            selectedItem: controller.selectedShippingType,
          ),
          // ChooseItemWithHolder(
          //   title: 'الشحن من',
          //   bottomSheetTitle: 'الشحن من',
          //   height: Get.height / 1.6,
          //   selectedItem: DataModel.empty().obs,
          //   body: const ChooseShippingPlace(),
          // ),
          // ChooseItemWithHolder(
          //   title: 'الشحن إلي',
          //   bottomSheetTitle: 'الشحن إلي',
          //   height: Get.height / 1.6,
          //   selectedItem: DataModel.empty().obs,
          //   body: const ChooseShippingPlace(),
          // ),
          ChooseItemWithHolder(
            title: 'حجم الشحنة',
            bottomSheetTitle: 'بيانات الشحنة',
            height: Get.height / 1.3,
            selectedItem: DataModel.empty().obs,
            body: AddShippingSize(
              packages: controller.packages,
              items: shippingFieldOptions,
              onAdd: controller.addNewPackageItem,
            ),
          ),
          TextFieldInputWithDropDownWithHolder(
            title: 'قيمة البضاعة بالدولار',
            firstInputHint: '2000',
            firstInputFlex: 2,
            selectedDropDownValue: ''.obs,
            source: const [],
          ),
          ChooseItemWithHolder(
            title: 'جاهزية الشحنة',
            selectedItem: DataModel.empty().obs,
            bottomSheetTitle: 'جاهزية الشحنة',
            height: Get.height / 2,
            body: MultiItemsList(
              items: const [],
              selectedItem: DataModel.empty().obs,
            ),
          ),
          AttachFileWithHolder(
            title: 'صورة للشحنة',
            file: File('').obs,
          ),
          const TextFieldInputWithHolder(
            hint: 'وصف الشحنة',
          ),
        ],
      ),
    );
  }
}

class _AdditionalServices extends GetView<AddEditAirFreightServiceController> {
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
            body: const ChooseCertificates([]),
            height: Get.height / 1.6,
          ),
          InkWell(
            onTap: () {
              Get.bottomSheet(
                HeadLineBottomSheet(
                  height: Get.height / 2,
                  body: const AddNotesSheet(
                    text: 'اذكر الملاحظات التي تود كتابتها',
                  ),
                  bottomSheetTitle: 'ملاحظاتي',
                ),
                isScrollControlled: true,
              );
            },
            child: Text(
              'اضافة ملاحظات',
              style: Get.textTheme.bodyMedium!.copyWith(
                color: ColorManager.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
