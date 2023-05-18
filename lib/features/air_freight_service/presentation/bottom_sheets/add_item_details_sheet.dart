part of '../../air_freight_service.dart';

class _AddItemDetailsSheet extends GetView<AddEditAirFreightServiceController> {
  const _AddItemDetailsSheet({Key? key}) : super(key: key);

  String get itemHint {
    if (controller.selectedThrough.value == 0) return 'مثال: قطع غيار';
    return 'مثال: مواد غذائية';
  }

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
                              hint: itemHint,
                              controller: controller.items[index].name,
                            ),
                            const Divider(
                              color: ColorManager.greyColor,
                            ),
                            Text(
                              'ابعاد الشحنة بالسم',
                              style: Get.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorManager.greyColor,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFieldInputWithHolder(
                                    hint: 'طول',
                                    controller: controller.items[index].length,
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      int lengthNumber = int.tryParse(controller
                                              .items[index].length.text) ??
                                          0;
                                      int widthNumber = int.tryParse(controller
                                              .items[index].width.text) ??
                                          0;
                                      int heightNumber = int.tryParse(controller
                                              .items[index].height.text) ??
                                          0;
                                      controller.items[index].cm.text =
                                          (lengthNumber *
                                                  widthNumber *
                                                  heightNumber)
                                              .toString();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TextFieldInputWithHolder(
                                    hint: 'عرض',
                                    controller: controller.items[index].width,
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      int lengthNumber = int.tryParse(controller
                                              .items[index].length.text) ??
                                          0;
                                      int widthNumber = int.tryParse(controller
                                              .items[index].width.text) ??
                                          0;
                                      int heightNumber = int.tryParse(controller
                                              .items[index].height.text) ??
                                          0;
                                      controller.items[index].cm.text =
                                          (lengthNumber *
                                                  widthNumber *
                                                  heightNumber)
                                              .toString();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TextFieldInputWithHolder(
                                    hint: 'ارتفاع',
                                    controller: controller.items[index].height,
                                    keyboardType: TextInputType.number,
                                    onChanged: (String value) {
                                      int lengthNumber = int.tryParse(controller
                                              .items[index].length.text) ??
                                          0;
                                      int widthNumber = int.tryParse(controller
                                              .items[index].width.text) ??
                                          0;
                                      int heightNumber = int.tryParse(controller
                                              .items[index].height.text) ??
                                          0;
                                      controller.items[index].cm.text =
                                          (lengthNumber *
                                                  widthNumber *
                                                  heightNumber)
                                              .toString();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TextFieldInputWithHolder(
                                    hint: 'الحجم',
                                    controller: controller.items[index].cm,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              color: ColorManager.greyColor,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFieldInputWithHolder(
                                    title: 'الوزن',
                                    controller:
                                        controller.items[index].weightPerUnit,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                Expanded(
                                  child: TextFieldInputWithHolder(
                                    title: 'الكمية',
                                    controller:
                                        controller.items[index].quantity,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
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
