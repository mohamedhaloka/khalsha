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
      serviceName: ServiceTypes.marineShipping.value,
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
            validator: FormBuilderValidators.required(),
            name: MarineShipmentInputsKeys.title.name,
          ),
          ToggleItemWithHolder(
            title: 'نوع الشحنة',
            items: shippingTypeOptions,
            selectedItem: controller.selectedShippingType,
          ),
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) => ChooseItemWithHolder(
              title: 'الشحن من',
              height: Get.height / 1.6,
              selectedItem: DataModel.empty().obs,
              body: ChooseShippingPlace(
                shipmentLocation: controller.fromShipmentLocation,
                selectedCountry: controller.fromCountryId,
                city: controller.fromCity,
                cityLocationDetails: controller.fromCityLocationDetails,
                countries: controller.countries,
                otherLocation: controller.fromShipmentOther,
                forSeaShipment: false,
              ),
              onBack: (bool hasEmptyData) => field.didChange(
                hasEmptyData ? '' : '_',
              ),
              errorMsg: field.errorText,
            ),
            validator: FormBuilderValidators.required(),
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
            builder: (FormFieldState<dynamic> field) => ChooseItemWithHolder(
              title: 'الشحن إلى',
              height: Get.height / 1.6,
              selectedItem: DataModel.empty().obs,
              body: ChooseShippingPlace(
                shipmentLocation: controller.toShipmentLocation,
                selectedCountry: controller.toCountryId,
                city: controller.toCity,
                cityLocationDetails: controller.toCityLocationDetails,
                countries: controller.countries,
                otherLocation: controller.toShipmentOther,
                forSeaShipment: false,
              ),
              onBack: (bool hasEmptyData) => field.didChange(
                hasEmptyData ? '' : '_',
              ),
              errorMsg: field.errorText,
            ),
            validator: FormBuilderValidators.required(),
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
          ToggleItemWithHolder(
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
            validator: FormBuilderValidators.required(),
            name: MarineShipmentInputsKeys.shipmentReady.name,
            onSaved: (_) => controller.didFieldChanged(
              MarineShipmentInputsKeys.shipmentReady.name,
              value: controller.selectedShipmentReady.value,
            ),
          ),
          Obx(
            () => TextFieldInputWithDropDownWithHolder(
              title: 'قيمة الشحنة',
              firstInputHint: '2000',
              firstInputFlex: 2,
              firstInputController: controller.price,
              selectedDropDownValue: controller.selectedCurrencyId,
              source: controller.currency
                  .map((e) => DropdownMenuItem(
                        value: e.id.toString(),
                        child: Text(e.name),
                      ))
                  .toList(),
            ),
          ),
          TextFieldInputWithHolder(
            hint: 'وصف الشحنة',
            controller: controller.content,
          )
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
          CheckerWithHolder(
            title: 'خدمة إستخراج الشهادات اللازمة',
            active: controller.enableCertificate,
            bottomSheetTitle: 'الشهادات',
            body: ChooseCertificates(controller.certificates),
            height: Get.height / 1.6,
          ),
        ],
      ),
    );
  }
}

enum MarineShipmentInputsKeys {
  title,
  shipmentFrom,
  shipmentTo,
  shipmentReady;
}
