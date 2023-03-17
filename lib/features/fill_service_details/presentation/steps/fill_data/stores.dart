part of 'fill_data_step_view.dart';

class _Stores extends GetView<FillDataController> {
  const _Stores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleItemWithHolder(
          title: 'الغرض من التخزين',
          items: controller.shippingFieldOptions,
          selectedItem: controller.selectedShippingField,
        ),
        const TextFieldInputWithHolder(
          title: 'نوع التخزين',
        ),
        const TextFieldInputWithHolder(
          title: 'نوع الصنف',
        ),
        ToggleItemWithHolder(
          title: 'نوع الشحنة',
          items: controller.shippingTypeOptions,
          selectedItem: controller.selectedShippingType,
        ),
        ToggleItemWithHolder(
          title: 'حجم الشحنة',
          items: controller.shippingFieldOptions,
          selectedItem: controller.selectedShippingField,
        ),
        ChooseItemWithHolder(
          title: 'المدينة/الدولة',
          selectedItem: controller.selectedShippingPlace,
          bottomSheetTitle: 'اختر منفذ الشحنة',
          height: Get.height / 2,
          body: MultiItemsList(
            items: controller.shippingPlacesOptions,
            selectedItem: controller.selectedShippingPlace,
          ),
        ),
        const TextFieldInputWithHolder(
          hint: 'وصف الشحنة',
        ),
      ],
    );
  }
}
