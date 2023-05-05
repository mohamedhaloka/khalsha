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
      body: Obx(() => Column(
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
              FormBuilderField(
                builder: (FormFieldState<dynamic> field) =>
                    TextFieldInputWithHolder(
                  hint: 'وصف الشحنة',
                  controller: controller.content,
                  onSaved: (String? value) => field.didChange(value),
                  errorText: field.errorText,
                ),
                validator: FormBuilderValidators.required(),
                name: LandShipmentInputsKeys.content.name,
              ),
              if (controller.goodsType.value == 1) ...[
                const _PrivateTransferInputsView(),
              ] else ...[
                const _BundledGoodsInputsView()
              ],
            ],
          )),
    );
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
          if (!controller.isInternationalShipping.value) ...[
            Obx(
              () => ServiceItemWithHolder(
                title: 'هل تريد خدمة التخزين',
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
          ServiceItemWithHolder(
            title: 'خدمات الفك و التركيب و التغليف',
            height: Get.height / 1.5,
            onDelete: () {},
            body: const DismantlingAndInstallationService(),
          ),
          if (controller.goodsType.value == 1) ...[
            DropDownInputWithHolder(
              title: 'تريد عمال تحميل وتنزيل',
              dropValue: controller.workersType,
              source: LoadTypes.values
                  .map((e) => DropdownMenuItem(
                        value: e.name,
                        child: Text(e.name.tr),
                      ))
                  .toList(),
            ),
          ],
          YesOrNoWithHolder(
            active: controller.hasFlammable,
            title: 'هل توجد مواد قابلة للإشتعال',
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
            title: 'تاريخ/وقت التحميل',
            text: controller.loadingDate.formatTime('dd-mm-yyyy'),
            btnHeight: inputHeight + 20,
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
            title: 'تاريخ/وقت التسليم',
            text: controller.deliveryDate.formatTime('dd-MM-yyyy'),
            btnHeight: inputHeight + 20,
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
  bundledQunatity,
  bundledUnit,
  bundledTotalWeight,
  bundledImage,
  truck,
  shipmentType;
}
