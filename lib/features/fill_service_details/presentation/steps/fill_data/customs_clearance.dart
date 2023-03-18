part of 'fill_data_step_view.dart';

class _CustomsClearance extends GetView<FillDataController> {
  const _CustomsClearance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleItemWithHolder(
          title: 'مجال الشحنة',
          items: controller.shippingFieldOptions,
          selectedItem: controller.selectedShippingField,
        ),
        ToggleItemWithHolder(
          title: 'نوع الشحنة',
          items: controller.shippingTypeOptions,
          selectedItem: controller.selectedShippingType,
        ),
        ChooseItemWithHolder(
          title: 'منفذ الشحنة',
          selectedItem: controller.selectedShippingPlace,
          bottomSheetTitle: 'اختر منفذ الشحنة',
          height: Get.height / 2,
          body: MultiItemsList(
            items: testItemsList,
            selectedItem: controller.selectedShippingPlace,
          ),
        ),
        const TextFieldInputWithHolder(
          title: 'التوصيل إلي',
        ),
        const TextFieldInputWithHolder(
          hint: 'وصف البضاعة',
        ),
        const TwiceTextFieldInputWithHolder(
          title: 'الإجمالي',
          firstInputHint: '2000',
          firstInputFlex: 2,
          secondInputHint: 'ر.س',
        ),
        ToggleItemWithHolder(
          title: 'نوع الشحن',
          items: controller.shipTypeOptions,
          selectedItem: controller.selectedShipType,
        ),
      ],
    );
  }
}
