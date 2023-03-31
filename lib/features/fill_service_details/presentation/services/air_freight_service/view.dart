import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../../../../core/data/models/item_model.dart';
import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../../../widgets/headline_bottom_sheet.dart';
import '../../bottom_sheet_content/add_notes_sheet.dart';
import '../../bottom_sheet_content/add_shipping_size.dart';
import '../../bottom_sheet_content/choose_certificates.dart';
import '../../bottom_sheet_content/choose_shipping_place.dart';
import '../../bottom_sheet_content/multi_items_list.dart';
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
      serviceName: ServiceType.airFreight.value,
      body: Column(
        children: [
          ToggleItemWithHolder(
            title: 'مجال الشحنة',
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
          ChooseItemWithHolder(
            title: 'حجم الشحنة',
            bottomSheetTitle: 'بيانات الشحنة',
            height: Get.height / 1.3,
            selectedItem: const ItemModel(text: '').obs,
            body: AddShippingSize(
              packages: controller.packages,
              items: shippingFieldOptions,
              onAdd: controller.addNewPackageItem,
            ),
          ),
          const TwiceTextFieldInputWithHolder(
            title: 'قيمة الشحنة',
            firstInputHint: '2000',
            firstInputFlex: 2,
            secondInputHint: 'ر.س',
          ),
          ChooseItemWithHolder(
            title: 'جاهزية الشحنة',
            selectedItem: controller.selectedShippingPlace,
            bottomSheetTitle: 'جاهزية الشحنة',
            height: Get.height / 2,
            body: MultiItemsList(
              items: testItemsList,
              selectedItem: controller.selectedShippingPlace,
            ),
          ),
          const AttachFileWithHolder(
            title: 'صورة للشحنة',
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
            body: const ChooseCertificates(),
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
