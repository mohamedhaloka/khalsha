part of '../../marine_shipping.dart';

class _AddContainerMarineShippingSheet
    extends GetView<AddEditMarineShippingServiceController> {
  const _AddContainerMarineShippingSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.separated(
                  itemBuilder: (_, int index) => Column(
                        children: [
                          TextFieldInputWithHolder(
                            title: 'وصف البضاعة',
                            hint: 'مثال: سيارة',
                            controller:
                                controller.containers[index].containerContent,
                          ),
                          const Divider(
                            color: ColorManager.greyColor,
                          ),
                          DropDownInputWithHolder(
                            title: 'نوع الحاوية',
                            dropValue:
                                controller.containers[index].containerType,
                            source: ContainerMarineShipmentTypes.values
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e.value,
                                    child: Text(e.value.tr),
                                  ),
                                )
                                .toList(),
                          ),
                          const Divider(
                            color: ColorManager.greyColor,
                          ),
                          ChooseNumberWithHolder(
                            title: 'عدد الحاويات',
                            currentNumber:
                                controller.containers[index].containerCount,
                          ),
                          const Divider(
                            color: ColorManager.greyColor,
                          ),
                          AttachFileWithHolder(
                            title: 'صورة الشحنة',
                            file: controller.containers[index].file,
                          ),
                          if (controller.containers.length > 1)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: CustomButton(
                                width: 40,
                                height: 40,
                                onTap: () => controller.containers
                                    .remove(controller.containers[index]),
                                imgName: 'delete',
                                backgroundColor: ColorManager.errorColor,
                              ),
                            ),
                        ],
                      ),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: controller.containers.length),
            ),
          ),
          Row(
            children: [
              const Expanded(child: Divider(color: ColorManager.primaryColor)),
              InkWell(
                onTap: () => controller.containers
                    .add(ContainerMarineShipmentModel.nexItem()),
                child: const Chip(label: Text('أضافة عنصر جديد +')),
              ),
              const Expanded(child: Divider(color: ColorManager.primaryColor)),
            ],
          ),
          Center(
            child: CustomButton(
              height: inputHeight,
              width: 100,
              radius: radius,
              text: 'تأكيد',
              onTap: Get.back,
            ),
          )
        ],
      ),
    );
  }
}

enum ContainerMarineShipmentTypes {
  feet20('20_feet'),
  feet40('40_feet'),
  hc40('40_hc'),
  hc45('45_hc');

  final String value;
  const ContainerMarineShipmentTypes(this.value);
}
