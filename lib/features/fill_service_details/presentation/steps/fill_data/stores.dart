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
        ChooseItemWithHolder(
          title: 'نوع التخزين',
          selectedItem: controller.selectedShippingPlace,
          bottomSheetTitle: 'نوع التخزين',
          height: Get.height / 2,
          body: MultiItemsList(
            items: testItemsList,
            selectedItem: controller.selectedShippingPlace,
          ),
        ),
        ChooseItemWithHolder(
          title: 'نوع الصنف',
          selectedItem: controller.selectedShippingPlace,
          bottomSheetTitle: 'نوع الصنف',
          height: Get.height / 2,
          body: MultiItemsList(
            items: testItemsList,
            selectedItem: controller.selectedShippingPlace,
          ),
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
            items: testItemsList,
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
