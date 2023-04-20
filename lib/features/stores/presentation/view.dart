part of '../stores.dart';

class AddEditStoresServiceView extends GetView<AddEditStoresServiceController> {
  const AddEditStoresServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ServiceContent(
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

class _FillData extends GetView<AddEditStoresServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceType.stores.value,
      body: Column(
        children: [
          TextFieldInputWithHolder(
            title: 'عنوان الطلب',
            hint: 'أضف عنوان',
            controller: controller.name,
          ),
          ToggleItemWithHolder(
            title: 'الغرض من التخزين',
            items: shippingFieldOptions,
            selectedItem: controller.selectedShippingField,
          ),
          DropDownInputWithHolder(
            title: 'نوع التخزين',
            hint: 'أختر',
            dropValue: controller.selectedStorageType,
            source: StorageTypes.values
                .map((e) => DropdownMenuItem(
                      value: e.value.toString(),
                      child: Text(e.value.tr),
                    ))
                .toList()
                .obs,
          ),
          ChooseItemWithHolder(
            title: 'نوع الصنف',
            selectedItem: controller.selectedItem,
            bottomSheetTitle: 'نوع الصنف',
            height: Get.height / 2,
            body: MultiItemsList(
              items: controller.items,
              selectedItem: controller.selectedItem,
            ),
          ),
          TextFieldInputWithHolder(
            title: 'المدينة/الدولة',
            controller: controller.location,
            enabled: false,
            onTap: controller.chooseLocation,
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
            title: 'هل تريد خدمة التغليف',
            active: controller.needPackaging,
          ),
          CheckerWithHolder(
            title: 'المساعدة بتسجيل المنتجات بالهيئة',
            active: controller.importCertificates,
          ),
          CheckerWithHolder(
            title: 'المساعة في إستخراج تراخيص الشركات و المؤسسات للاستيراد',
            active: controller.exportCertificates,
          ),
          CheckerWithHolder(
            title: 'المساعة في إجراءات وزارة الزراعة',
            active: controller.farmingProcedures,
          ),
          CheckerWithHolder(
            title: 'خدمة إستخراج الشهادات اللازمة',
            active: controller.certificates
                .any((element) => element.selected.value)
                .obs,
            bottomSheetTitle: 'الشهادات',
            body: ChooseCertificates(controller.certificates),
            height: Get.height / 1.6,
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
