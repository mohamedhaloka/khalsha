part of '../marine_shipping.dart';

class AddEditMarineShippingServiceView
    extends GetView<AddEditMarineShippingServiceController> {
  const AddEditMarineShippingServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKey,
      child: ServiceContent(
        onTapBack: controller.onTapBack,
        onPageChanged: controller.onPageChanged,
        pageViewController: controller.pageController,
        pageTitle: controller.pageTitle,
        onTapNext: controller.onTapNext,
        currentStep: controller.currentStep,
        btnLoading: controller.loading,
        children: controller.children,
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
      body: Column(
        children: [
          FormBuilderField(
            initialValue: controller.name,
            builder: (FormFieldState<dynamic> field) =>
                TextFieldInputWithHolder(
              title: 'عنوان الطلب',
              hint: 'أضف عنوان',
              controller: controller.name,
              onChanged: (String value) => field.didChange(value),
              errorText: field.errorText,
            ),
            validator: FormBuilderValidators.required(),
            name: 'name',
          ),
          ToggleItemWithHolder(
            title: 'نوع الشحنة',
            items: shippingTypeOptions,
            selectedItem: controller.selectedShippingType,
          ),
          FormBuilderField(
            initialValue: '_',
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
              ),
              onBack: (bool hasEmptyData) => field.didChange(
                hasEmptyData ? '' : '_',
              ),
              errorMsg: field.errorText,
            ),
            validator: FormBuilderValidators.required(),
            name: 'shipment_from',
          ),
          FormBuilderField(
            initialValue: '_',
            builder: (FormFieldState<dynamic> field) => ChooseItemWithHolder(
              title: 'الشحن من',
              height: Get.height / 1.6,
              selectedItem: DataModel.empty().obs,
              body: ChooseShippingPlace(
                shipmentLocation: controller.toShipmentLocation,
                selectedCountry: controller.toCountryId,
                city: controller.toCity,
                cityLocationDetails: controller.toCityLocationDetails,
                countries: controller.countries,
                otherLocation: controller.toShipmentOther,
              ),
              onBack: (bool hasEmptyData) => field.didChange(
                hasEmptyData ? '' : '_',
              ),
              errorMsg: field.errorText,
            ),
            validator: FormBuilderValidators.required(),
            name: 'shipment_to',
          ),
          ToggleItemWithHolder(
            title: 'حجم الشحنة',
            items: marineOrderSizeOptions,
            selectedItem: controller.selectedShipmentSize,
            onChooseItem: (ItemModel item) {
              late Widget bottomSheetBody;
              if (item.id == 0) {
                bottomSheetBody = const _AddContainerMarineShippingSheet();
              } else {
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
          FormBuilderField(
            initialValue: controller.selectedShipmentReady,
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
            name: 'shipment_ready',
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

enum ShipmentReadyPeriods {
  ready('ready'),
  oneWeekOrLess('one_week_or_less'),
  twoWeeksOrLess('two_weeks_or_less');

  final String value;
  const ShipmentReadyPeriods(this.value);
}
