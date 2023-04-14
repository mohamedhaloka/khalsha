import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/bottom_sheet_content/dismantling_and_installation_service.dart';
import 'package:khalsha/features/widgets/steps/pick_locations_step_view.dart';

import '../../../../core/data/models/data_model.dart';
import '../../../../core/service_utils.dart';
import '../../../service_intro/presentation/get/controllers/controller.dart';
import '../../../widgets/bottom_sheet_content/add_location_sheet.dart';
import '../../../widgets/bottom_sheet_content/choose_date_time_sheet.dart';
import '../../../widgets/bottom_sheet_content/multi_items_list.dart';
import '../../../widgets/bottom_sheet_content/order_temperature.dart';
import '../../../widgets/bottom_sheet_content/set_number_count.dart';
import '../../../widgets/inputs/attach_file_with_holder.dart';
import '../../../widgets/inputs/choose_item_with_holder.dart';
import '../../../widgets/inputs/service_item_with_holder.dart';
import '../../../widgets/inputs/text_field_input_with_holder.dart';
import '../../../widgets/inputs/toggle_item_with_holder.dart';
import '../../../widgets/inputs/yes_or_no_with_holder.dart';
import '../../../widgets/service_content.dart';
import '../../../widgets/steps/additional_service_step_view.dart';
import '../../../widgets/steps/confirm_order_step_view.dart';
import '../../../widgets/steps/fill_data_step_view.dart';
import '../../../widgets/steps/order_send_successfully_step_view.dart';
import 'get/controllers/controller.dart';

class InternationalPrivateTransferLandShippingServiceView
    extends GetView<InternationalPrivateTransferLandShippingServiceController> {
  const InternationalPrivateTransferLandShippingServiceView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ServiceContent(
        onTapBack: controller.onTapBack,
        onPageChanged: controller.onPageChanged,
        pageViewController: controller.pageController,
        pageTitle: controller.pageTitle,
        onTapNext: controller.onTapNext,
        currentStep: controller.currentIndex,
        btnLoading: false.obs,
        children: const [
          _FillData(),
          _AdditionalServices(),
          _PickLocations(),
          ConfirmOrderStepView(),
          OrderSendSuccessfullyStepView(),
        ],
      ),
    );
  }
}

class _FillData
    extends GetView<InternationalPrivateTransferLandShippingServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName:
          '${ServiceType.landShipping.value.tr} / ${'private-transfer'.tr}',
      body: Column(
        children: [
          ToggleItemWithHolder(
            title: 'مجال الشحنة',
            items: shippingFieldOptions,
            selectedItem: 0.obs,
          ),
          ChooseItemWithHolder(
            title: 'نوع الشحنة',
            selectedItem: DataModel.empty().obs,
            height: Get.height / 2,
            body: MultiItemsList(
              items: const [],
              selectedItem: DataModel.empty().obs,
            ),
          ),
          const TextFieldInputWithHolder(
            title: 'وصف الشحنة',
            hint: 'ثلاجات',
          ),
          ChooseItemWithHolder(
            title: 'نوع الشاحنة',
            selectedItem: DataModel.empty().obs,
            height: Get.height / 2,
            body: MultiItemsList(
              items: const [],
              selectedItem: DataModel.empty().obs,
            ),
          ),
          const AttachFileWithHolder(
            title: 'صورة الشحنة',
          ),
        ],
      ),
    );
  }
}

class _AdditionalServices
    extends GetView<InternationalPrivateTransferLandShippingServiceController> {
  const _AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Column(
        children: [
          ServiceItemWithHolder(
            title: 'خدمات التغليف',
            height: Get.height / 1.5,
            onDelete: () {},
            body: const DismantlingAndInstallationService(),
          ),
          ServiceItemWithHolder(
            title: 'درجة حرارة الشحنة',
            bottomSheetTitle: 'درجة الحرارة',
            height: Get.height / 2,
            onDelete: () {},
            body: const OrderTemperature(),
          ),
          ServiceItemWithHolder(
            title: 'هل تحتاج عمال تحميل',
            bottomSheetTitle: 'عمال تحميل',
            height: Get.height / 3,
            onDelete: () {},
            body: SetNumberCount(
              number: 0.obs,
              title: 'عدد العمال',
            ),
          ),
          ServiceItemWithHolder(
            title: 'هل تحتاج عمال تنزيل',
            bottomSheetTitle: 'عمال تنزيل',
            height: Get.height / 3,
            onDelete: () {},
            body: SetNumberCount(
              number: 0.obs,
              title: 'عدد العمال',
            ),
          ),
          ServiceItemWithHolder(
            title: 'هل تريد التخزين',
            bottomSheetTitle: 'خدمة التخزين',
            height: Get.height / 3,
            onDelete: () {},
            body: SetNumberCount(
              number: 0.obs,
              title: 'عدد أيام التخزين',
            ),
          ),
          YesOrNoWithHolder(
            active: true.obs,
            title: 'هل توجد مواد قابلة للإشتعال',
          ),
        ],
      ),
    );
  }
}

class _PickLocations
    extends GetView<InternationalPrivateTransferLandShippingServiceController> {
  const _PickLocations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PickLocationsStepView(
      children: [
        ServiceItemWithHolder(
          title: 'موقع التحميل',
          height: Get.height / 1.8,
          onDelete: () {},
          body: AddLocationSheet(
            items: <int>[1].obs,
            allowMulti: true,
          ),
        ),
        ServiceItemWithHolder(
          title: 'موقع التسليم',
          height: Get.height / 1.8,
          onDelete: () {},
          body: AddLocationSheet(
            items: <int>[1].obs,
          ),
        ),
        ServiceItemWithHolder(
          title: 'تاريخ/وقت التسليم',
          height: Get.height / 1.8,
          onDelete: () {},
          body: const ChooseDateTimeSheet(),
        ),
      ],
    );
  }
}
