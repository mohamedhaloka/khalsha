part of 'fill_data_step_view.dart';

class _MarineShipping extends GetView<FillDataController> {
  const _MarineShipping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleItemWithHolder(
          title: 'نوع الشحنة',
          items: controller.shippingTypeOptions,
          selectedItem: controller.selectedShippingType,
        ),
        ChooseItemWithHolder(
          title: 'الشحن من',
          bottomSheetTitle: 'الشحن من',
          height: Get.height / 1.6,
          selectedItem: const ItemModel(text: '').obs,
          body: const ChooseShippingPlace(),
        ),
        ChooseItemWithHolder(
          title: 'الشحن إلي',
          bottomSheetTitle: 'الشحن إلي',
          height: Get.height / 1.6,
          selectedItem: const ItemModel(text: '').obs,
          body: const ChooseShippingPlace(),
        ),
        ToggleItemWithHolder(
          title: 'حجم الشحنة',
          items: controller.shippingTypeOptions,
          selectedItem: controller.selectedShippingType,
        ),
        ChooseItemWithHolder(
          title: 'بيانات الشحنة',
          bottomSheetTitle: 'بيانات الشحنة',
          height: Get.height / 1.6,
          selectedItem: const ItemModel(text: '').obs,
          body: const SetShippingDetails(),
        ),
        const MultiTextFieldInputWithHolder(
          title: 'قيمة الشحنة',
          firstInputHint: '2000',
          firstInputFlex: 2,
          secondInputHint: 'ر.س',
        ),
        AttachFileWithHolder(
          title: 'صورة للشحنة',
        ),
        const TextFieldInputWithHolder(
          hint: 'وصف الشحنة',
        )
      ],
    );
  }
}
