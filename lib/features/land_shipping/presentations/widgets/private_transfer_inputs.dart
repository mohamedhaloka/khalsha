part of '../../land_shipping.dart';

class _PrivateTransferInputsView
    extends GetView<AddEditLandShippingServiceController> {
  const _PrivateTransferInputsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormBuilderField(
          builder: (FormFieldState<dynamic> field) => ChooseItemWithHolder(
            title: 'نوع الشاحنة',
            selectedItem: controller.truck,
            height: Get.height / 2,
            errorMsg: field.errorText,
            body: MultiItemsList(
              items: controller.trucks,
              selectedItem: controller.truck,
            ),
          ),
          onSaved: (_) => controller.didFieldChanged(
            LandShipmentInputsKeys.truck.name,
            value: controller.truck.value.name,
          ),
          validator: FormBuilderValidators.required(),
          name: LandShipmentInputsKeys.truck.name,
        ),
        FormBuilderField(
          builder: (FormFieldState<dynamic> field) => ChooseItemWithHolder(
            title: 'نوع الشحنة',
            selectedItem: controller.shipmentType,
            height: Get.height / 2,
            errorMsg: field.errorText,
            body: MultiItemsList(
              items: controller.shipmentTypes,
              selectedItem: controller.shipmentType,
            ),
          ),
          onSaved: (_) => controller.didFieldChanged(
            LandShipmentInputsKeys.shipmentType.name,
            value: controller.shipmentType.value.name,
          ),
          validator: FormBuilderValidators.required(),
          name: LandShipmentInputsKeys.shipmentType.name,
        ),
      ],
    );
  }
}
