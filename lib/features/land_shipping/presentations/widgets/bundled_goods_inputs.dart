part of '../../land_shipping.dart';

class _BundledGoodsInputsView
    extends GetView<AddEditLandShippingServiceController> {
  const _BundledGoodsInputsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, int index) => Column(
              children: [
                FormBuilderField(
                  builder: (FormFieldState<dynamic> field) =>
                      TextFieldInputWithHolder(
                    title: 'الصنف',
                    hint: 'غرفة نوم،أثاث بضاعة',
                    controller: controller.bundledGoodsItems[index].name,
                    onSaved: (String? value) => field.didChange(value),
                    errorText: field.errorText,
                  ),
                  validator: FormBuilderValidators.required(),
                  name: LandShipmentInputsKeys.bundledName.name,
                ),
                FormBuilderField(
                  builder: (FormFieldState<dynamic> field) =>
                      TextFieldInputWithHolder(
                    title: 'الكمية',
                    controller: controller.bundledGoodsItems[index].quantity,
                    onSaved: (String? value) => field.didChange(value),
                    errorText: field.errorText,
                  ),
                  validator: FormBuilderValidators.required(),
                  name: LandShipmentInputsKeys.bundledQunatity.name,
                ),
                FormBuilderField(
                  builder: (FormFieldState<dynamic> field) =>
                      DropDownInputWithHolder(
                    title: 'وحدة',
                    dropValue: controller.bundledGoodsItems[index].unit,
                    errorText: field.errorText,
                    source: UnitTypes.values
                        .map((e) => DropdownMenuItem(
                              value: e.name,
                              child: Text(e.name.tr),
                            ))
                        .toList(),
                  ),
                  onSaved: (_) => controller.didFieldChanged(
                    LandShipmentInputsKeys.bundledUnit.name,
                    value: controller.bundledGoodsItems[index].unit.value,
                  ),
                  validator: FormBuilderValidators.required(),
                  name: LandShipmentInputsKeys.bundledUnit.name,
                ),
                FormBuilderField(
                  builder: (FormFieldState<dynamic> field) =>
                      TextFieldInputWithHolder(
                    title: 'إجمالي الوزن',
                    controller: controller.bundledGoodsItems[index].totalWeight,
                    onSaved: (String? value) => field.didChange(value),
                    errorText: field.errorText,
                  ),
                  validator: FormBuilderValidators.required(),
                  name: LandShipmentInputsKeys.bundledTotalWeight.name,
                ),
                FormBuilderField(
                  builder: (FormFieldState<dynamic> field) =>
                      AttachFileWithHolder(
                    title: 'صورة الشحنة',
                    file: controller.bundledGoodsItems[index].image,
                    errorMsg: field.errorText,
                  ),
                  onSaved: (_) => controller.didFieldChanged(
                    LandShipmentInputsKeys.bundledImage.name,
                    value: controller.bundledGoodsItems[index].image.value.path,
                  ),
                  validator: FormBuilderValidators.required(),
                  name: LandShipmentInputsKeys.bundledImage.name,
                ),
                if (controller.bundledGoodsItems.length > 1)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomButton(
                      width: 40,
                      height: 40,
                      onTap: () => controller.bundledGoodsItems
                          .remove(controller.bundledGoodsItems[index]),
                      imgName: 'delete',
                      backgroundColor: ColorManager.errorColor,
                    ),
                  ),
              ],
            ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: controller.bundledGoodsItems.length,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: () =>
                controller.bundledGoodsItems.add(BundledGoodsModel.newItem()),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(radius)),
                border: Border.all(color: ColorManager.greyColor),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('إضافة صنف أخر'),
            ),
          ),
        ),
      ],
    );
  }
}

enum UnitTypes { unit, piece }
