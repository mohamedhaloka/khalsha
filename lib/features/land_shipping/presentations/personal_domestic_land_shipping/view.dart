import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/data_model.dart';
import 'package:khalsha/features/widgets/bottom_sheet_content/dismantling_and_installation_service.dart';
import 'package:khalsha/features/widgets/inputs/text_field_input_with_holder.dart';

import '../../../service_intro/presentation/get/controllers/controller.dart';
import '../../../widgets/bottom_sheet_content/add_location_sheet.dart';
import '../../../widgets/bottom_sheet_content/choose_date_time_sheet.dart';
import '../../../widgets/bottom_sheet_content/multi_items_list.dart';
import '../../../widgets/bottom_sheet_content/set_number_count.dart';
import '../../../widgets/inputs/attach_file_with_holder.dart';
import '../../../widgets/inputs/choose_item_with_holder.dart';
import '../../../widgets/inputs/service_item_with_holder.dart';
import '../../../widgets/service_content.dart';
import '../../../widgets/steps/additional_service_step_view.dart';
import '../../../widgets/steps/confirm_order_step_view.dart';
import '../../../widgets/steps/fill_data_step_view.dart';
import '../../../widgets/steps/order_send_successfully_step_view.dart';
import '../../../widgets/steps/pick_locations_step_view.dart';
import '../commercial_domestic_land_shipping/get/controllers/controller.dart';
import 'get/controllers/controller.dart';

class PersonalDomesticLandShippingServiceView
    extends GetView<PersonalDomesticLandShippingServiceController> {
  const PersonalDomesticLandShippingServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ServiceContent(
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
    );
  }
}

class _FillData extends GetView<PersonalDomesticLandShippingServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName:
          '${ServiceType.landShipping.value.tr} / ${'personal-domestic'.tr}',
      body: Column(
        children: [
          ChooseItemWithHolder(
            title: 'نوع البضاعة',
            selectedItem: DataModel.empty().obs,
            height: Get.height / 2,
            body: MultiItemsList(
              items: const [],
              selectedItem: DataModel.empty().obs,
            ),
          ),
          const TextFieldInputWithHolder(
            title: 'وصف الشحنة',
            hint: 'مثال: نقل عفش منزلي',
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
          AttachFileWithHolder(
            title: 'صورة الشحنة',
            file: File('').obs,
          ),
        ],
      ),
    );
  }
}

class _AdditionalServices
    extends GetView<PersonalDomesticLandShippingServiceController> {
  const _AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Column(
        children: [
          ServiceItemWithHolder(
            title: 'هل تريد خدمة التخزين',
            bottomSheetTitle: 'خدمة التخزين',
            height: Get.height / 3,
            onDelete: () {},
            body: SetNumberCount(
              number: 0.obs,
              title: 'عدد أيام التخزين',
            ),
          ),
          ServiceItemWithHolder(
            title: 'خدمات الفك و التركيب و التغليف',
            height: Get.height / 1.5,
            onDelete: () {},
            body: const DismantlingAndInstallationService(),
          ),
        ],
      ),
    );
  }
}

class _PickLocations
    extends GetView<CommercialDomesticLandShippingServiceController> {
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
          title: 'تاريخ/وقت التحميل',
          height: Get.height / 1.8,
          onDelete: () {},
          body: const ChooseDateTimeSheet(),
        ),
      ],
    );
  }
}
