part of 'stores.dart';

class AddEditStoresServiceView extends GetView<AddEditStoresServiceController> {
  const AddEditStoresServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ServiceContent(
          onTapBack: controller.onTapBack,
          onPageChanged: controller.onPageChanged,
          pageViewController: controller.pageController,
          pageTitle: controller.pageTitle,
          onTapNext: controller.onTapNext,
          currentStep: controller.currentStep,
          btnLoading: false.obs,
          children: const [
            _FillData(),
            ShippingDetailsStepView(),
            _AdditionalServices(),
            ConfirmOrderStepView(),
            OrderSendSuccessfullyStepView(),
          ],
        ));
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
          const TextFieldInputWithHolder(
            title: 'عنوان الطلب',
            hint: 'أضف عنوان',
          ),
          ToggleItemWithHolder(
            title: 'الغرض من التخزين',
            items: shippingFieldOptions,
            selectedItem: controller.selectedShippingField,
          ),
          ChooseItemWithHolder(
            title: 'نوع التخزين',
            selectedItem: DataModel.empty().obs,
            bottomSheetTitle: 'نوع التخزين',
            height: Get.height / 2,
            body: MultiItemsList(
              items: [],
              selectedItem: DataModel.empty().obs,
            ),
          ),
          ChooseItemWithHolder(
            title: 'نوع الصنف',
            selectedItem: DataModel.empty().obs,
            bottomSheetTitle: 'نوع الصنف',
            height: Get.height / 2,
            body: MultiItemsList(
              items: [],
              selectedItem: DataModel.empty().obs,
            ),
          ),
          ToggleItemWithHolder(
            title: 'حجم الشحنة',
            items: storesOrderSizeOptions,
            selectedItem: controller.selectedStoresOrderSize,
          ),
          ChooseItemWithHolder(
            title: 'المدينة/الدولة',
            selectedItem: DataModel.empty().obs,
            bottomSheetTitle: 'اختر منفذ الشحنة',
            height: Get.height / 2,
            body: MultiItemsList(
              items: [],
              selectedItem: DataModel.empty().obs,
            ),
          ),
          const TextFieldInputWithHolder(
            hint: 'وصف الشحنة',
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
            active: false.obs,
          ),
          CheckerWithHolder(
            title: 'المساعدة بتسجيل المنتجات بالهيئة',
            active: false.obs,
          ),
          CheckerWithHolder(
            title: 'المساعة في إستخراج تراخيص الشركات و المؤسسات للاستيراد',
            active: true.obs,
          ),
          CheckerWithHolder(
            title: 'المساعة في إجراءات وزارة الزراعة',
            active: false.obs,
          ),
        ],
      ),
    );
  }
}
