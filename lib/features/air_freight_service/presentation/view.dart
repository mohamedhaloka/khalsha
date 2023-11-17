part of '../air_freight_service.dart';

class AddEditAirFreightServiceView
    extends GetView<AddEditAirFreightServiceController> {
  const AddEditAirFreightServiceView({Key? key}) : super(key: key);

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
          icon: 'air-flight-shipment',
          children: controller.children,
        ),
      ),
    );
  }
}

class _FillData extends GetView<AddEditAirFreightServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceTypes.airFreight.value,
      image: 'air',
      body: Column(
        children: [
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) =>
                TextFieldInputWithHolder(
              title: 'عنوان الطلب',
              hint: 'مثال: شحن قطع غيار',
              controller: controller.name,
              onSaved: (String? value) => field.didChange(value),
              errorText: field.errorText,
            ),
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: AirFreightInputsKeys.title.name,
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
                  cityLocationDetails: controller.fromCityLocationDetails,
                  onSelectLocation: (locationDetails) =>
                      controller.fromCityLocationDetails = locationDetails,
                  countries: controller.countries,
                  otherLocation: controller.fromShipmentOther,
                  forSeaShipment: false,
                ),
                onBack: (bool hasEmptyData) => field.didChange(
                  hasEmptyData ? '' : '_',
                ),
                errorMsg: field.errorText,
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: AirFreightInputsKeys.shipmentFrom.name,
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
                AirFreightInputsKeys.shipmentFrom.name,
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
                  forSeaShipment: false,
                ),
                onBack: (bool hasEmptyData) => field.didChange(
                  hasEmptyData ? '' : '_',
                ),
                errorMsg: field.errorText,
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: AirFreightInputsKeys.shipmentTo.name,
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
                AirFreightInputsKeys.shipmentTo.name,
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
            name: AirFreightInputsKeys.shipmentReady.name,
            onSaved: (_) => controller.didFieldChanged(
              AirFreightInputsKeys.shipmentReady.name,
              value: controller.selectedShipmentReady.value,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderDetails extends GetView<AddEditAirFreightServiceController> {
  const _OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      imagePath: 'assets/images/intro_services/air.svg',
      body: Column(
        children: [
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) => ToggleItemWithHolder(
              title: 'احسب من خلال',
              items: marinePackageTypeOptions,
              selectedItem: controller.selectedThrough,
              onChooseItem: (ItemModel item) => Get.bottomSheet(
                HeadLineBottomSheet(
                  bottomSheetTitle: item.text,
                  body: const _AddItemDetailsSheet(),
                  height: Get.height / 1.2,
                ),
                isScrollControlled: true,
              ),
              errorMsg: field.errorText,
            ),
            onSaved: (String? value) {
              bool hasEmptyInputs = controller.items.any((element) =>
                  element.name.text.isEmpty ||
                  element.length.text.isEmpty ||
                  element.height.text.isEmpty ||
                  element.width.text.isEmpty ||
                  element.cm.text.isEmpty ||
                  element.weightPerUnit.text.isEmpty ||
                  element.image.value.path.isEmpty ||
                  element.quantity.text.isEmpty);

              controller.didFieldChanged(
                AirFreightInputsKeys.calculateThrough.name,
                value: hasEmptyInputs ? '' : 'xx',
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: AirFreightInputsKeys.calculateThrough.name,
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
            name: AirFreightInputsKeys.content.name,
          ),
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) =>
                Obx(() => TextFieldInputWithDropDownWithHolder(
                      title: 'قيمة البضاعة',
                      firstInputHint: '2000',
                      secondInputHint: 'العملة',
                      firstInputFlex: 2,
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
                AirFreightInputsKeys.price.name,
                value: hasEmptyInputs ? '' : 'xx',
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: AirFreightInputsKeys.price.name,
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
                AirFreightInputsKeys.certificates.name,
                value: hasSelectedCertificates ? 'xx' : '',
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: AirFreightInputsKeys.certificates.name,
          ),
        ],
      ),
    );
  }
}

enum AirFreightInputsKeys {
  title,
  content,
  shipmentFrom,
  shipmentTo,
  shipmentReady,
  certificates,
  price,
  calculateThrough;
}
