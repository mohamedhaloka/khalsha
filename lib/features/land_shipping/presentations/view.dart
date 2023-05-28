part of '../land_shipping.dart';

class AdEditLandShippingServiceView
    extends GetView<AddEditLandShippingServiceController> {
  const AdEditLandShippingServiceView({Key? key}) : super(key: key);

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

class _FillData extends GetView<AddEditLandShippingServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceTypes.landShipping.value,
      image: 'land',
      body: Obx(() => Column(
            children: [
              FormBuilderField(
                builder: (FormFieldState<dynamic> field) =>
                    TextFieldInputWithHolder(
                  title: 'عنوان الطلب',
                  hint: orderTitle,
                  controller: controller.name,
                  onSaved: (String? value) => field.didChange(value),
                  errorText: field.errorText,
                ),
                validator: FormBuilderValidators.required(),
                name: LandShipmentInputsKeys.title.name,
              ),
              ToggleItemWithHolder(
                title: 'مجال الشحنة',
                items: shippingFieldOptions,
                selectedItem: controller.shippingType,
              ),
              if (controller.isInternationalShipping.value) ...[
                FormBuilderField(
                  builder: (FormFieldState<dynamic> field) =>
                      ChooseItemWithHolder(
                    title: 'من الدولة',
                    selectedItem: controller.fromCountry,
                    height: Get.height / 2,
                    errorMsg: field.errorText,
                    body: MultiItemsList(
                      items: controller.countries,
                      selectedItem: controller.fromCountry,
                    ),
                  ),
                  onSaved: (_) => controller.didFieldChanged(
                    LandShipmentInputsKeys.fromCountry.name,
                    value: controller.fromCountry.value.name,
                  ),
                  validator: FormBuilderValidators.required(),
                  name: LandShipmentInputsKeys.fromCountry.name,
                ),
                FormBuilderField(
                  builder: (FormFieldState<dynamic> field) =>
                      ChooseItemWithHolder(
                    title: 'إلي الدولة',
                    selectedItem: controller.toCountry,
                    height: Get.height / 2,
                    errorMsg: field.errorText,
                    body: MultiItemsList(
                      items: controller.countries,
                      selectedItem: controller.toCountry,
                    ),
                  ),
                  onSaved: (_) => controller.didFieldChanged(
                    LandShipmentInputsKeys.toCountry.name,
                    value: controller.toCountry.value.name,
                  ),
                  validator: FormBuilderValidators.required(),
                  name: LandShipmentInputsKeys.toCountry.name,
                ),
                ToggleItemWithHolder(
                  title: 'نوع البضاعة',
                  items: internationalItemsType,
                  selectedItem: controller.goodsType,
                ),
              ],
              if (controller.goodsType.value == 1) ...[
                const _PrivateTransferInputsView(),
              ] else ...[
                const _BundledGoodsInputsView()
              ],
              FormBuilderField(
                builder: (FormFieldState<dynamic> field) =>
                    TextFieldInputWithHolder(
                  hint:
                      'وصف الشحنة مثال: اثاث منزلي يتكون من غرفة نوم و ثلاث مكيفات و مطبخ أمريكي',
                  controller: controller.content,
                  maxLines: 4,
                  onSaved: (String? value) => field.didChange(value),
                  errorText: field.errorText,
                ),
                validator: FormBuilderValidators.required(),
                name: LandShipmentInputsKeys.content.name,
              ),
            ],
          )),
    );
  }

  String get orderTitle {
    if (controller.shippingType.value == 0) return 'مثال: شحن عفش منزلي';
    return 'مثال: نقل أخشاب / حديد';
  }
}

class _AdditionalServices
    extends GetView<AddEditLandShippingServiceController> {
  const _AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Column(
        children: [
          if (controller.goodsType.value == 1)
            // FormBuilderField(
            // builder: (FormFieldState<dynamic> field) =>
            ServiceItemWithHolder(
              title: 'خدمة الفك والتركيب والتغليف',
              height: Get.height / 1.5,
              onDelete: () {},
              // errorMsg: field.errorText,
              body: const DismantlingAndInstallationService(),
            ),
          //   onSaved: (_) {
          //     final hasEmptyInputs = controller.serviceData.any((element) =>
          //         element.quantity.text.isEmpty || element.item.text.isEmpty);
          //     controller.didFieldChanged(
          //       LandShipmentInputsKeys.packUnPackPackaging.name,
          //       value: hasEmptyInputs ? '' : 'xx',
          //     );
          //   },
          //   validator: FormBuilderValidators.required(),
          //   name: LandShipmentInputsKeys.packUnPackPackaging.name,
          // ),
          if (!controller.isInternationalShipping.value) ...[
            Obx(
              () => ServiceItemWithHolder(
                title: 'خدمة التخزين',
                height: Get.height / 3,
                onDelete: () => controller.storageDays(0),
                text: controller.storageDays.value > 0 ? 'تم' : null,
                body: SetNumberCount(
                  number: controller.storageDays,
                  title: 'عدد أيام التخزين',
                ),
              ),
            )
          ],
          if (controller.goodsType.value == 1)
            FormBuilderField(
              builder: (FormFieldState<dynamic> field) =>
                  DropDownInputWithHolder(
                title: 'عمال تحميل/تنزيل',
                dropValue: controller.workersType,
                source: LoadTypes.values
                    .map((e) => DropdownMenuItem(
                          value: e.name,
                          child: Text(e.name.tr),
                        ))
                    .toList(),
                errorText: field.errorText,
              ),
              onSaved: (_) => controller.didFieldChanged(
                LandShipmentInputsKeys.workers.name,
                value: controller.workersType.value,
              ),
              validator: FormBuilderValidators.required(),
              name: LandShipmentInputsKeys.workers.name,
            ),
          YesOrNoWithHolder(
            active: controller.hasFlammable,
            title: 'هل تحتوي الشحنة علي مواد قابلة للإشتعال',
          ),
        ],
      ),
    );
  }
}

enum LoadTypes {
  load,
  unload,
  both,
  no,
}

class _PickLocations extends GetView<AddEditLandShippingServiceController> {
  const _PickLocations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PickLocationsStepView(
      children: [
        const _LoadingUnLoadingLocationsInputs(),
        StatefulBuilder(
          builder: (_, setState) => ServiceItemWithHolder(
            title: 'تاريخ / وقت التحميل',
            text: controller.loadingDate.formatTime('dd-mm-yyyy'),
            btnHeight: inputHeight + 20,
            btnWidth: inputHeight + 50,
            onTap: () => _chooseDateTime(
              controller.loadingDate,
              minTime: DateTime.now(),
              onConfirm: (DateTime date) {
                controller.loadingDate = date;
                setState(() {});
              },
            ),
          ),
        ),
        StatefulBuilder(
          builder: (_, setState) => ServiceItemWithHolder(
            title: 'تاريخ / وقت التسليم',
            text: controller.deliveryDate.formatTime('dd-MM-yyyy'),
            btnHeight: inputHeight + 20,
            btnWidth: inputHeight + 50,
            onTap: () => _chooseDateTime(
              controller.deliveryDate,
              minTime: DateTime.now().add(const Duration(days: 1)),
              onConfirm: (DateTime date) {
                controller.deliveryDate = date;
                setState(() {});
              },
            ),
          ),
        ),
      ],
    );
  }

  void _chooseDateTime(DateTime dateTime,
          {required DateTime minTime,
          required void Function(DateTime date) onConfirm}) =>
      DatePicker.showDateTimePicker(
        Get.context!,
        showTitleActions: true,
        minTime: minTime,
        onConfirm: onConfirm,
        currentTime: dateTime,
        locale: Lang.instance.isEn ? LocaleType.en : LocaleType.ar,
      );
}

enum LandShipmentInputsKeys {
  title,
  fromCountry,
  toCountry,
  content,
  bundledName,
  bundledQuantity,
  bundledUnit,
  bundledTotalWeight,
  bundledImage,
  truck,
  shipmentType,
  packUnPackPackaging,
  workers,
  loadingLocation,
  loadingLocationType,
  unloadingLocation,
  unloadingLocationType,
  recipientName,
  recipientMobile;
}
