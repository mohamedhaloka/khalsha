part of '../marine_shipping.dart';

class AddEditMarineShippingServiceView
    extends GetView<AddEditMarineShippingServiceController> {
  const AddEditMarineShippingServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKey,
      child: Obx(
        () => ServiceContent(
          onTapBack: controller.onTapBack,
          onPageChanged: controller.onPageChanged,
          pageViewController: controller.pageController,
          pageTitle: controller.pageTitle,
          onTapNext: controller.onTapNext,
          currentStep: controller.currentStep,
          btnLoading: controller.loading,
          nextTitle: controller.nextTitle,
          icon: 'marine_shipment_icon',
          children: controller.children,
        ),
      ),
    );
  }
}

class _FillData extends GetView<AddEditMarineShippingServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceTypes.marineShipping.value,
      image: 'marine',
      body: Column(
        children: [
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) =>
                TextFieldInputWithHolder(
              title: 'عنوان الطلب',
              hint: 'مثال: شحن سيارة شخصية',
              controller: controller.name,
              onSaved: (String? value) => field.didChange(value),
              errorText: field.errorText,
            ),
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: MarineShipmentInputsKeys.title.name,
          ),
          ToggleItemWithHolder(
            title: 'نوع الشحنة',
            items: shippingTypeOptions,
            selectedItem: controller.selectedShippingType,
          ),
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) {
              String text =
                  '${controller.fromShipmentLocation.value.tr},  ${controller.fromCity.text}';
              return ChooseItemWithHolder(
                title: 'الشحن من',
                height: Get.height / 1.6,
                boxColor: (field.value ?? '').isEmpty
                    ? null
                    : ColorManager.primaryColor,
                textColor: (field.value ?? '').isEmpty ? null : Colors.white,
                selectedItem:
                    DataModel.initial((field.value ?? '').isEmpty ? null : text)
                        .obs,
                body: ChooseShippingPlace(
                  shipmentLocation: controller.fromShipmentLocation,
                  selectedCountry: controller.fromCountryId,
                  city: controller.fromCity,
                  onSelectLocation: (locationDetails) =>
                      controller.fromCityLocationDetails = locationDetails,
                  cityLocationDetails: controller.fromCityLocationDetails,
                  countries: controller.countries,
                  otherLocation: controller.fromShipmentOther,
                ),
                onBack: (bool hasEmptyData) => field.didChange(
                  hasEmptyData ? '' : '_',
                ),
                errorMsg: field.errorText,
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: MarineShipmentInputsKeys.shipmentFrom.name,
            onSaved: (_) {
              final hasEmptyInputs =
                  controller.fromShipmentLocation.value.isEmpty ||
                      (controller.fromShipmentLocation.value ==
                              MarinePlacesOfShipment.other.value
                          ? controller.fromShipmentOther.text.isEmpty
                          : false) ||
                      controller.fromCountryId.value.isEmpty ||
                      controller.fromCity.text.isEmpty;
              controller.didFieldChanged(
                MarineShipmentInputsKeys.shipmentFrom.name,
                value: hasEmptyInputs ? '' : '_',
              );
            },
          ),
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) {
              String text =
                  '${controller.toShipmentLocation.value.tr},  ${controller.toCity.text}';
              return ChooseItemWithHolder(
                title: 'الشحن إلى',
                height: Get.height / 1.6,
                boxColor: (field.value ?? '').isEmpty
                    ? null
                    : ColorManager.primaryColor,
                textColor: (field.value ?? '').isEmpty ? null : Colors.white,
                selectedItem:
                    DataModel.initial((field.value ?? '').isEmpty ? null : text)
                        .obs,
                body: ChooseShippingPlace(
                  shipmentLocation: controller.toShipmentLocation,
                  selectedCountry: controller.toCountryId,
                  city: controller.toCity,
                  onSelectLocation: (locationDetails) =>
                      controller.toCityLocationDetails = locationDetails,
                  cityLocationDetails: controller.toCityLocationDetails,
                  countries: controller.countries,
                  otherLocation: controller.toShipmentOther,
                ),
                onBack: (bool hasEmptyData) => field.didChange(
                  hasEmptyData ? '' : '_',
                ),
                errorMsg: field.errorText,
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: MarineShipmentInputsKeys.shipmentTo.name,
            onSaved: (_) {
              final hasEmptyInputs =
                  controller.toShipmentLocation.value.isEmpty ||
                      (controller.toShipmentLocation.value ==
                              MarinePlacesOfShipment.other.value
                          ? controller.toShipmentOther.text.isEmpty
                          : false) ||
                      controller.toCountryId.value.isEmpty ||
                      controller.toCity.text.isEmpty;
              controller.didFieldChanged(
                MarineShipmentInputsKeys.shipmentTo.name,
                value: hasEmptyInputs ? '' : '_',
              );
            },
          ),
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) => DropDownInputWithHolder(
              title: 'هل الشحنة جاهزة',
              dropValue: controller.selectedShipmentReady,
              source: ShipmentReadyPeriods.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.value,
                      child: Text(e.value.tr),
                    ),
                  )
                  .toList(),
              onTap: (int id) => field.didChange(id.toString()),
              errorText: field.errorText,
            ),
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: MarineShipmentInputsKeys.shipmentReady.name,
            onSaved: (_) => controller.didFieldChanged(
              MarineShipmentInputsKeys.shipmentReady.name,
              value: controller.selectedShipmentReady.value,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderDetails extends GetView<AddEditMarineShippingServiceController> {
  const _OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Column(
        children: [
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) => ToggleItemWithHolder(
              title: 'حجم الشحنة',
              items: marineOrderSizeOptions,
              errorMsg: field.errorText,
              toolTipMsg:
                  '''( البضائع مجمعة : استئجار مساحة مخصصة داخل الحاوية لنقل بضاعتك مع بضاعة اخرين.
حاوية : استئجار كامل المساحة داخل الحاوية.''',
              selectedItem: controller.selectedShipmentSize,
              onChooseItem: (ItemModel item) {
                late Widget bottomSheetBody;
                if (item.id == 0) {
                  controller.goodsTotalShipment.clear();
                  controller.goodsUnitType.clear();
                  bottomSheetBody = const _AddContainerMarineShippingSheet();
                } else {
                  controller.containers.clear();
                  bottomSheetBody = const _BundledGoodsMarineShippingSheet();
                }
                Get.bottomSheet(
                  HeadLineBottomSheet(
                    bottomSheetTitle: item.text,
                    body: bottomSheetBody,
                    height: Get.height / 1.2,
                  ),
                  isScrollControlled: true,
                );
              },
            ),
            onSaved: (_) {
              bool hasEmptyInputs = false;
              if (controller.selectedShipmentSize.value == 0) {
                hasEmptyInputs = controller.containers.any((element) =>
                    element.file.value.path.isEmpty ||
                    element.containerContent.text.isEmpty ||
                    element.containerType.value.isEmpty ||
                    element.containerCount.value == 0);
              } else {
                if (controller.selectedThrough.value == 0) {
                  hasEmptyInputs = controller.goodsTotalShipment.any(
                      (element) =>
                          element.quantity.text.isEmpty ||
                          element.totalWeight.text.isEmpty ||
                          element.overallSize.text.isEmpty);
                } else {
                  hasEmptyInputs = controller.goodsUnitType.any((element) =>
                      element.quantity.text.isEmpty ||
                      element.image.value.path.isEmpty ||
                      element.cm.text.isEmpty ||
                      element.width.text.isEmpty ||
                      element.height.text.isEmpty ||
                      element.weightPerUnit.text.isEmpty ||
                      element.length.text.isEmpty);
                }
              }
              controller.didFieldChanged(
                MarineShipmentInputsKeys.orderSize.name,
                value: hasEmptyInputs ? '' : 'xx',
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: MarineShipmentInputsKeys.orderSize.name,
          ),
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) =>
                TextFieldInputWithHolder(
              hint: 'الملاحظات',
              maxLines: 4,
              controller: controller.content,
              onSaved: (String? value) => field.didChange(value),
              errorText: field.errorText,
            ),
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: MarineShipmentInputsKeys.content.name,
          ),
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) =>
                Obx(() => TextFieldInputWithDropDownWithHolder(
                      title: 'قيمة البضاعة',
                      firstInputHint: '2000',
                      firstInputFlex: 2,
                      secondInputHint: 'العملة',
                      firstInputController: controller.price,
                      selectedDropDownValue: controller.selectedCurrencyId,
                      source: controller.currency
                          .map((e) => DropdownMenuItem(
                                value: e.id.toString(),
                                child: Text(e.name),
                              ))
                          .toList(),
                      errorMsg: field.errorText,
                    )),
            onSaved: (_) {
              bool hasEmptyInputs = controller.price.text.isEmpty ||
                  controller.selectedCurrencyId.value.isEmpty;
              controller.didFieldChanged(
                MarineShipmentInputsKeys.price.name,
                value: hasEmptyInputs ? '' : 'xx',
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: MarineShipmentInputsKeys.price.name,
          ),
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
            active: controller.enableInsurance,
          ),
          CheckerWithHolder(
            title: 'خدمة التخليص الجمركي',
            active: controller.enableCustomsClearance,
          ),
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) => CheckerWithHolder(
              title: 'خدمة إستخراج الشهادات اللازمة',
              active: controller.certificates
                  .any((element) => element.selected.value)
                  .obs,
              bottomSheetTitle: 'الشهادات',
              body: ChooseCertificates(controller.certificates),
              height: Get.height / 1.6,
              errotText: field.errorText,
            ),
            onSaved: (_) {
              bool hasSelectedCertificates = controller.certificates
                  .any((element) => element.selected.value);
              controller.didFieldChanged(
                MarineShipmentInputsKeys.certificates.name,
                value: hasSelectedCertificates ? 'xx' : '',
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: MarineShipmentInputsKeys.certificates.name,
          ),
        ],
      ),
    );
  }
}

enum ShipmentReadyPeriods {
  ready('ready'),
  oneWeekOrLess('one_week_or_less'),
  twoWeeksOrLess('two_weeks_or_less');

  final String value;
  const ShipmentReadyPeriods(this.value);
}

enum MarineShipmentInputsKeys {
  title,
  content,
  shipmentFrom,
  shipmentTo,
  shipmentReady,
  certificates,
  price,
  orderSize;
}
