part of '../../air_freight_service.dart';

class _AddItemDetailsSheet extends GetView<AddEditAirFreightServiceController> {
  const _AddItemDetailsSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Obx(() => ListView.separated(
                        itemBuilder: (_, int index) => Column(
                          children: [
                            TextFieldInputWithHolder(
                              title: 'اسم الصنف',
                              controller: controller.items[index].name,
                            ),
                            const Divider(
                              color: ColorManager.greyColor,
                            ),
                            TextFieldInputWithHolder(
                              title: 'الطول',
                              controller: controller.items[index].length,
                              keyboardType: TextInputType.number,
                            ),
                            const Divider(
                              color: ColorManager.greyColor,
                            ),
                            TextFieldInputWithHolder(
                              title: 'العرض',
                              controller: controller.items[index].width,
                              keyboardType: TextInputType.number,
                            ),
                            const Divider(
                              color: ColorManager.greyColor,
                            ),
                            TextFieldInputWithHolder(
                              title: 'الإرتفاع',
                              controller: controller.items[index].height,
                            ),
                            const Divider(
                              color: ColorManager.greyColor,
                            ),
                            TextFieldInputWithHolder(
                              title: 'سم',
                              controller: controller.items[index].cm,
                            ),
                            const Divider(
                              color: ColorManager.greyColor,
                            ),
                            TextFieldInputWithHolder(
                              title: 'الوزن لكل وحدة',
                              controller: controller.items[index].weightPerUnit,
                              keyboardType: TextInputType.number,
                            ),
                            const Divider(
                              color: ColorManager.greyColor,
                            ),
                            TextFieldInputWithHolder(
                              title: 'الكمية',
                              controller: controller.items[index].quantity,
                              keyboardType: TextInputType.number,
                            ),
                            const Divider(
                              color: ColorManager.greyColor,
                            ),
                            AttachFileWithHolder(
                              title: 'صورة الشحنة',
                              file: controller.items[index].image,
                            ),
                            if (controller.items.length > 1)
                              Align(
                                alignment: Alignment.centerLeft,
                                child: CustomButton(
                                  width: 40,
                                  height: 40,
                                  onTap: () => controller.items
                                      .remove(controller.items[index]),
                                  imgName: 'delete',
                                  backgroundColor: ColorManager.errorColor,
                                ),
                              ),
                          ],
                        ),
                        separatorBuilder: (_, __) =>
                            Divider(color: Get.theme.primaryColor),
                        itemCount: controller.items.length,
                      )),
                ),
                Row(
                  children: [
                    const Expanded(
                        child: Divider(color: ColorManager.greyColor)),
                    InkWell(
                      onTap: () =>
                          controller.items.add(AirFreightItemModel.nexItem()),
                      child: Chip(
                        label: const Text(
                          'إضافة طرد أخر+',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Get.theme.primaryColor,
                      ),
                    ),
                    const Expanded(
                        child: Divider(color: ColorManager.greyColor)),
                  ],
                ),
              ],
            ),
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
