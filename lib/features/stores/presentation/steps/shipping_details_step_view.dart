part of '../../stores.dart';

class ShippingDetailsStepView extends GetView<AddEditStoresServiceController> {
  const ShippingDetailsStepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          children: [
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
            ),
            if (controller.selectedSpaceType.value ==
                SpaceTypes.pallet.value) ...[
              TextFieldInputWithHolder(
                title: 'عدد الطبليات',
                controller: controller.palletNumber,
              ),
            ] else ...[
              DropDownInputWithHolder(
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
              ),
              if (controller.selectedWareHouseSpace.value ==
                  WareHouseTypes.custom.value) ...[
                TextFieldInputWithHolder(
                  title: 'المساحة بالمتر المربع',
                  controller: controller.customWareHouseSpace,
                ),
              ],
            ],
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
