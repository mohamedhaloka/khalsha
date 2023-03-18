part of 'fill_data_step_view.dart';

class _AirFreight extends GetView<FillDataController> {
  const _AirFreight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToggleItemWithHolder(
          title: 'مجال الشحنة',
          items: controller.shippingFieldOptions,
          selectedItem: controller.selectedShippingField,
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
        ChooseItemWithHolder(
          title: 'حجم الشحنة',
          bottomSheetTitle: 'بيانات الشحنة',
          height: Get.height / 1.3,
          selectedItem: const ItemModel(text: '').obs,
          body: AddShippingSize(
            packages: controller.packages,
            items: controller.shippingFieldOptions,
            onAdd: controller.addNewPackageItem,
          ),
        ),
        const TwiceTextFieldInputWithHolder(
          title: 'قيمة الشحنة',
          firstInputHint: '2000',
          firstInputFlex: 2,
          secondInputHint: 'ر.س',
        ),
        ChooseItemWithHolder(
          title: 'جاهزية الشحنة',
          selectedItem: controller.selectedShippingPlace,
          bottomSheetTitle: 'نوع الشحنة',
          height: Get.height / 2,
          body: MultiItemsList(
            items: testItemsList,
            selectedItem: controller.selectedShippingPlace,
          ),
        ),
        const AttachFileWithHolder(
          title: 'صورة للشحنة',
        ),
        const TextFieldInputWithHolder(
          hint: 'وصف الشحنة',
        ),
      ],
    );
  }
}
