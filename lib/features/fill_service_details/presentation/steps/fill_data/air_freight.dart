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
        const MultiTextFieldInputWithHolder(
          title: 'قيمة الشحنة',
          firstInputHint: '2000',
          firstInputFlex: 2,
          secondInputHint: 'ر.س',
        ),
        const TextFieldInputWithHolder(
          hint: 'وصف الشحنة',
        ),
      ],
    );
  }
}
