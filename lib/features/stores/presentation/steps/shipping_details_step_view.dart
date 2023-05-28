part of '../../stores.dart';

class ShippingDetailsStepView extends GetView<AddEditStoresServiceController> {
  const ShippingDetailsStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      imagePath: 'assets/images/intro_services/stores.svg',
      body: Obx(() => Column(
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
                    StoresInputsKeys.spaceType.name,
                    value: value,
                  );
                },
                name: StoresInputsKeys.spaceType.name,
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
                  name: StoresInputsKeys.palletNumbers.name,
                ),
              ] else ...[
                FormBuilderField(
                  builder: (FormFieldState<dynamic> field) {
                    return DropDownInputWithHolder(
                      title: 'نوع المساحة',
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
                    StoresInputsKeys.wareHouseSpace.name,
                    value: value ?? '',
                  ),
                  name: StoresInputsKeys.wareHouseSpace.name,
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
                    name: StoresInputsKeys.customWareHouseSpace.name,
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
                    StoresInputsKeys.contractType.name,
                    value: value,
                  );
                },
                name: StoresInputsKeys.contractType.name,
              ),
              FormBuilderField(
                builder: (FormFieldState<dynamic> field) => InputHolderBox(
                  CounterComponent(
                    number: controller.contractDays,
                    title: 'مدة التعاقد',
                  ),
                  errorText: field.errorText,
                ),
                validator: FormBuilderValidators.required(),
                onSaved: (_) {
                  controller.didFieldChanged(
                    StoresInputsKeys.contractDays.name,
                    value: controller.contractDays.value > 0 ? 'xx' : '',
                  );
                },
                name: StoresInputsKeys.contractDays.name,
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
          )),
    );
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
