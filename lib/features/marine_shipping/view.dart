part of 'marine_shipping.dart';

class AddEditMarineShippingServiceView
    extends GetView<AddEditMarineShippingServiceController> {
  const AddEditMarineShippingServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ServiceContent(
      onTapBack: controller.onTapBack,
      onPageChanged: controller.onPageChanged,
      pageViewController: controller.pageController,
      pageTitle: controller.pageTitle,
      onTapNext: controller.onTapNext,
      currentStep: 0.obs,
      btnLoading: false.obs,
      children: const [
        _FillData(),
        _AdditionalServices(),
        ConfirmOrderStepView(),
        OrderSendSuccessfullyStepView(),
      ],
    );
  }
}

class _FillData extends GetView<AddEditMarineShippingServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceType.marineShipping.value,
      body: Column(
        children: [
          ToggleItemWithHolder(
            title: 'نوع الشحنة',
            items: shippingTypeOptions,
            selectedItem: controller.selectedShippingType,
          ),
          ChooseItemWithHolder(
            title: 'الشحن من',
            bottomSheetTitle: 'الشحن من',
            height: Get.height / 1.6,
            selectedItem: DataModel.empty().obs,
            body: const ChooseShippingPlace(),
          ),
          ChooseItemWithHolder(
            title: 'الشحن إلي',
            bottomSheetTitle: 'الشحن إلي',
            height: Get.height / 1.6,
            selectedItem: DataModel.empty().obs,
            body: const ChooseShippingPlace(),
          ),
          ToggleItemWithHolder(
            title: 'حجم الشحنة',
            items: marineOrderSizeOptions,
            selectedItem: controller.selectedMarineOrderSize,
            onChooseItem: (ItemModel item) {
              late Widget bottomSheetBody;
              if (item.id == 0) {
                bottomSheetBody = const _ParcelMarineShippingSheet();
              } else {
                bottomSheetBody = const _BundledGoodsMarineShippingSheet();
              }
              Get.bottomSheet(
                  HeadLineBottomSheet(
                    bottomSheetTitle: item.text,
                    body: bottomSheetBody,
                    height: Get.height / 1.2,
                  ),
                  isScrollControlled: true);
            },
          ),
          TextFieldInputWithDropDownWithHolder(
            title: 'قيمة الشحنة',
            firstInputHint: '2000',
            firstInputFlex: 2,
            selectedDropDownValue: ''.obs,
            source: [],
          ),
          const TextFieldInputWithHolder(
            hint: 'وصف الشحنة',
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
            active: true.obs,
          ),
          CheckerWithHolder(
            title: 'خدمة التخليص الجمركي',
            active: true.obs,
          ),
          // CheckerWithHolder(
          //   title: 'المساعدة في إستخراج الشهادات',
          //   active: false.obs,
          //   bottomSheetTitle: 'الشهادات',
          //   body: const ChooseCertificates(),
          //   height: Get.height / 1.6,
          // ),
        ],
      ),
    );
  }
}
