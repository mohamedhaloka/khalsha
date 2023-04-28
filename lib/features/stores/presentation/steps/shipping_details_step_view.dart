part of '../../stores.dart';

class ShippingDetailsStepView extends GetView<AddEditStoresServiceController> {
  const ShippingDetailsStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          children: [
            FormBuilderField(
              builder: (FormFieldState<dynamic> field) =>
                  DropDownInputWithHolder(
                title: 'المساحة المطلوبة',
                hint: 'أختر',
                dropValue: controller.selectedSpaceType,
                source: SpaceTypes.values
                    .map((e) => DropdownMenuItem(
                          value: e.value.toString(),
                          child: Text(e.value.tr),
                        ))
                    .toList()
                    .obs,
                onTap: (int id) => field.didChange(id.toString()),
                errorText: field.errorText,
              ),
              validator: FormBuilderValidators.required(),
              onSaved: (_) {
                final value = controller.selectedSpaceType.value;
                controller.didFieldChanged(
                  'space_type',
                  value: value,
                );
              },
              name: 'space_type',
            ),
            if (controller.selectedSpaceType.value ==
                SpaceTypes.pallet.value) ...[
              FormBuilderField(
                builder: (FormFieldState<dynamic> field) =>
                    TextFieldInputWithHolder(
                  title: 'عدد الطبليات',
                  controller: controller.palletNumber,
                  onChanged: (String value) => field.didChange(value),
                  onSaved: (String? value) => field.didChange(value),
                  errorText: field.errorText,
                ),
                validator: FormBuilderValidators.required(),
                name: 'pallet_numbers',
              ),
            ] else ...[
              FormBuilderField(
                builder: (FormFieldState<dynamic> field) {
                  return DropDownInputWithHolder(
                    title: 'المساحة التي تحتاجها',
                    hint: 'أختر',
                    dropValue: controller.selectedWareHouseSpace,
                    source: WareHouseTypes.values
                        .map((e) => DropdownMenuItem(
                              value: e.value.toString(),
                              child: Text(e.value.tr),
                            ))
                        .toList()
                        .obs,
                    onTap: (int id) => field.didChange(id.toString()),
                    errorText: field.errorText,
                  );
                },
                validator: FormBuilderValidators.required(),
                onSaved: (String? value) => controller.didFieldChanged(
                  'ware_house_space',
                  value: value ?? '',
                ),
                name: 'ware_house_space',
              ),
              if (controller.selectedWareHouseSpace.value ==
                  WareHouseTypes.custom.value) ...[
                FormBuilderField(
                  builder: (FormFieldState<dynamic> field) =>
                      TextFieldInputWithHolder(
                    title: 'المساحة بالمتر المربع',
                    controller: controller.customWareHouseSpace,
                    onChanged: (String value) => field.didChange(value),
                    onSaved: (String? value) => field.didChange(value),
                    errorText: field.errorText,
                  ),
                  validator: FormBuilderValidators.required(),
                  name: 'custom_ware_house_space',
                ),
              ],
            ],
            FormBuilderField(
              builder: (FormFieldState<dynamic> field) =>
                  DropDownInputWithHolder(
                title: 'نوع التعاقد',
                hint: 'أختر',
                dropValue: controller.selectedContactType,
                source: ContractTypes.values
                    .map((e) => DropdownMenuItem(
                          value: e.value.toString(),
                          child: Text(e.value.tr),
                        ))
                    .toList()
                    .obs,
                onTap: (int id) => field.didChange(id.toString()),
                errorText: field.errorText,
              ),
              validator: FormBuilderValidators.required(),
              onSaved: (_) {
                final value = controller.selectedContactType.value;
                controller.didFieldChanged(
                  'contract_type',
                  value: value,
                );
              },
              name: 'contract_type',
            ),
            InputHolderBox(
              CounterComponent(
                number: controller.contractDays,
                title: 'مدة التعاقد',
              ),
            ),
            ServiceItemWithHolder(
              title: 'بداية التعاقد',
              text: 'تم',
              height: Get.height / 1.8,
              body: CalenderView(
                initialDate: controller.contractDate,
                onDateChanged: (d) {
                  controller.contractDate = d;
                  Get.back();
                },
              ),
            ),
            TextFieldInputWithHolder(
              title: 'ملاحظات',
              controller: controller.notes,
            ),
          ],
        ));
  }
}

enum SpaceTypes {
  full('full'),
  pallet('pallet');

  final String value;
  const SpaceTypes(this.value);
}

enum WareHouseTypes {
  allSpace('all_space'),
  custom('custom');

  final String value;
  const WareHouseTypes(this.value);
}

enum ContractTypes {
  perDay('per_day'),
  perMonth('per_month');

  final String value;
  const ContractTypes(this.value);
}
