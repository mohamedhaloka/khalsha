part of '../stores.dart';

class AddEditStoresServiceView extends GetView<AddEditStoresServiceController> {
  const AddEditStoresServiceView({Key? key}) : super(key: key);

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
          icon: 'warehouse_icon',
          children: controller.children,
        ),
      ),
    );
  }
}

class _FillData extends GetView<AddEditStoresServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceTypes.stores.value,
      image: 'stores',
      body: Column(
        children: [
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) =>
                TextFieldInputWithHolder(
              title: 'عنوان الطلب',
              hint: 'مثال: طلب مستودع',
              controller: controller.name,
              onChanged: (String value) => field.didChange(value),
              onSaved: (String? value) => field.didChange(value),
              errorText: field.errorText,
            ),
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: StoresInputsKeys.title.name,
          ),
          ToggleItemWithHolder(
            title: 'الغرض من التخزين',
            items: shippingFieldOptions,
            selectedItem: controller.selectedShippingField,
          ),
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) => DropDownInputWithHolder(
              title: 'نوع التخزين',
              hint: 'أختر',
              dropValue: controller.selectedStorageType,
              itemHeight: 70,
              source: StorageTypes.values
                  .map((e) => DropdownMenuItem(
                        value: e.value.toString(),
                        child: Text(
                          e.value.tr,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ))
                  .toList()
                  .obs,
              onTap: (int id) => field.didChange(id.toString()),
              errorText: field.errorText,
            ),
            onSaved: (String? value) {
              controller.didFieldChanged(
                StoresInputsKeys.storageType.name,
                value: controller.selectedStorageType.value,
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: StoresInputsKeys.storageType.name,
          ),
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) => ChooseItemWithHolder(
              title: 'نوع الصنف',
              selectedItem: controller.selectedItem,
              height: Get.height / 2,
              body: MultiItemsList(
                  items: controller.items,
                  selectedItem: controller.selectedItem,
                  onSelectItem: (DataModel data) =>
                      field.didChange(data.id.toString())),
              errorMsg: field.errorText,
            ),
            onSaved: (String? value) {
              controller.didFieldChanged(
                StoresInputsKeys.itemType.name,
                value: controller.selectedItem.value.id == 0 ? '' : 'xx',
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: StoresInputsKeys.itemType.name,
          ),
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) =>
                TextFieldInputWithHolder(
              title: 'المدينة/الدولة',
              controller: controller.location,
              enabled: false,
              onTap: controller.chooseLocation,
              onSaved: (String? value) => field.didChange(value),
              errorText: field.errorText,
            ),
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: StoresInputsKeys.location.name,
          ),
        ],
      ),
    );
  }
}

class _AdditionalServices extends GetView<AddEditStoresServiceController> {
  const _AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Column(
        children: [
          CheckerWithHolder(
            title: 'خدمة التغليف',
            active: controller.needPackaging,
          ),
          CheckerWithHolder(
            title: 'خدمة تسجيل المنتجات بالهيئة',
            active: controller.importCertificates,
          ),
          CheckerWithHolder(
            title: 'خدمة إستخراج التراخيص اللازمة للاستيراد',
            active: controller.exportCertificates,
          ),
          CheckerWithHolder(
            title: 'خدمة تخليص إجراءات وزارة الزراعة',
            active: controller.farmingProcedures,
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
                StoresInputsKeys.certificates.name,
                value: hasSelectedCertificates ? 'xx' : '',
              );
            },
            validator: FormBuilderValidators.required(
                errorText: 'input-is-required'.tr),
            name: StoresInputsKeys.certificates.name,
          ),
        ],
      ),
    );
  }
}

enum StorageTypes {
  conditioner2520('conditioner_25_20'),
  cold210('cold_2_10'),
  frozenMinus18('frozen_minus_18'),
  dryStorage('dry_storage');

  final String value;
  const StorageTypes(this.value);
}

enum StoresInputsKeys {
  title,
  storageType,
  itemType,
  location,
  shipmentReady,
  certificates,
  price,
  orderSize,
  spaceType,
  palletNumbers,
  wareHouseSpace,
  customWareHouseSpace,
  contractType,
  contractDays;
}
