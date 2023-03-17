part of 'fill_data_step_view.dart';

class _LandShipping extends GetView<FillDataController> {
  const _LandShipping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleItemWithHolder(
          title: 'نوع الشحن',
          items: controller.shippingFieldOptions,
          selectedItem: controller.selectedShippingField,
        ),
        ChooseItemWithHolder(
          title: 'نوع الشاحنة',
          selectedItem: controller.selectedShippingPlace,
          bottomSheetTitle: 'نوع الشاحنة',
          height: Get.height / 2,
          body: MultiItemsList(
            items: controller.shippingPlacesOptions,
            selectedItem: controller.selectedShippingPlace,
          ),
        ),
        ChooseItemWithHolder(
          title: 'نوع الشحنة',
          selectedItem: controller.selectedShippingPlace,
          bottomSheetTitle: 'نوع الشحنة',
          height: Get.height / 2,
          body: MultiItemsList(
            items: controller.shippingPlacesOptions,
            selectedItem: controller.selectedShippingPlace,
          ),
        ),
        ChooseItemWithHolder(
          title: 'شحن دولي',
          selectedItem: controller.selectedShippingPlace,
          bottomSheetTitle: 'شحن دولي',
          height: Get.height / 2,
          body: MultiItemsList(
            items: controller.shippingPlacesOptions,
            selectedItem: controller.selectedShippingPlace,
          ),
        ),
        const TextFieldInputWithHolder(
          hint: 'وصف الشحنة',
        ),
        const TextFieldInputWithHolder(
          hint: 'أضف ملاحظات',
        ),
      ],
    );
  }
}
