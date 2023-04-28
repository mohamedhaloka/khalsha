part of '../../marine_shipping.dart';

class _BundledGoodsMarineShippingSheet
    extends GetView<AddEditMarineShippingServiceController> {
  const _BundledGoodsMarineShippingSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Obx(() => Column(
            children: [
              ToggleItemWithHolder(
                title: 'أحسب من خلال',
                items: controller.throughOptions,
                selectedItem: controller.selectedThrough,
                onChooseItem: (ItemModel item) {
                  if (item.id == 0) {
                    controller.goodsTotalShipment
                        .add(GoodsTotalShipmentMarineShipmentModel.nexItem());
                    controller.goodsUnitType.clear();
                  } else {
                    controller.goodsUnitType
                        .add(GoodsUnitTypeMarineShipmentModel.nexItem());
                    controller.goodsTotalShipment.clear();
                  }
                },
              ),
              const Divider(
                indent: 20,
                endIndent: 20,
              ),
              if (controller.selectedThrough.value == 0) ...[
                const _GoodsTotalShipment()
              ] else ...[
                const _GoodsUnitTypeShipment(),
              ],
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
          )),
    );
  }
}

class _GoodsTotalShipment
    extends GetView<AddEditMarineShippingServiceController> {
  const _GoodsTotalShipment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.separated(
                  itemBuilder: (_, int index) => Column(
                    children: [
                      TextFieldInputWithHolder(
                        title: 'الحجم الكلي',
                        controller:
                            controller.goodsTotalShipment[index].overallSize,
                        keyboardType: TextInputType.number,
                      ),
                      const Divider(
                        color: ColorManager.greyColor,
                      ),
                      TextFieldInputWithHolder(
                        title: 'الوزن الكلي',
                        controller:
                            controller.goodsTotalShipment[index].totalWeight,
                        keyboardType: TextInputType.number,
                      ),
                      const Divider(
                        color: ColorManager.greyColor,
                      ),
                      TextFieldInputWithHolder(
                        title: 'الكمية',
                        controller:
                            controller.goodsTotalShipment[index].quantity,
                        keyboardType: TextInputType.number,
                      ),
                      if (controller.goodsTotalShipment.length > 1)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomButton(
                            width: 40,
                            height: 40,
                            onTap: () => controller.goodsTotalShipment
                                .remove(controller.goodsTotalShipment[index]),
                            imgName: 'delete',
                            backgroundColor: ColorManager.errorColor,
                          ),
                        ),
                    ],
                  ),
                  separatorBuilder: (_, __) =>
                      Divider(color: Get.theme.primaryColor),
                  itemCount: controller.goodsTotalShipment.length,
                )),
          ),
          Row(
            children: [
              const Expanded(child: Divider(color: ColorManager.greyColor)),
              InkWell(
                onTap: () => controller.goodsTotalShipment
                    .add(GoodsTotalShipmentMarineShipmentModel.nexItem()),
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
              const Expanded(child: Divider(color: ColorManager.greyColor)),
            ],
          ),
        ],
      ),
    );
  }
}

class _GoodsUnitTypeShipment
    extends GetView<AddEditMarineShippingServiceController> {
  const _GoodsUnitTypeShipment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Obx(() => ListView.separated(
                  itemBuilder: (_, int index) => Column(
                    children: [
                      ToggleItemWithHolder(
                        title: 'نوع الطرد',
                        items: marinePackageTypeOptions,
                        selectedItem: controller.goodsUnitType[index].unitType,
                      ),
                      const Divider(
                        color: ColorManager.greyColor,
                      ),
                      TextFieldInputWithHolder(
                        title: 'الطول',
                        controller: controller.goodsUnitType[index].length,
                        keyboardType: TextInputType.number,
                      ),
                      const Divider(
                        color: ColorManager.greyColor,
                      ),
                      TextFieldInputWithHolder(
                        title: 'العرض',
                        controller: controller.goodsUnitType[index].width,
                        keyboardType: TextInputType.number,
                      ),
                      const Divider(
                        color: ColorManager.greyColor,
                      ),
                      TextFieldInputWithHolder(
                        title: 'الإرتفاع',
                        controller: controller.goodsUnitType[index].height,
                      ),
                      const Divider(
                        color: ColorManager.greyColor,
                      ),
                      TextFieldInputWithHolder(
                        title: 'سم',
                        controller: controller.goodsUnitType[index].cm,
                      ),
                      const Divider(
                        color: ColorManager.greyColor,
                      ),
                      TextFieldInputWithHolder(
                        title: 'الوزن لكل وحدة',
                        controller:
                            controller.goodsUnitType[index].weightPerUnit,
                        keyboardType: TextInputType.number,
                      ),
                      const Divider(
                        color: ColorManager.greyColor,
                      ),
                      TextFieldInputWithHolder(
                        title: 'الكمية',
                        controller: controller.goodsUnitType[index].quantity,
                        keyboardType: TextInputType.number,
                      ),
                      const Divider(
                        color: ColorManager.greyColor,
                      ),
                      AttachFileWithHolder(
                        title: 'صورة الشحنة',
                        file: controller.goodsUnitType[index].image,
                      ),
                      if (controller.goodsUnitType.length > 1)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomButton(
                            width: 40,
                            height: 40,
                            onTap: () => controller.goodsUnitType
                                .remove(controller.goodsUnitType[index]),
                            imgName: 'delete',
                            backgroundColor: ColorManager.errorColor,
                          ),
                        ),
                    ],
                  ),
                  separatorBuilder: (_, __) =>
                      Divider(color: Get.theme.primaryColor),
                  itemCount: controller.goodsUnitType.length,
                )),
          ),
          Row(
            children: [
              const Expanded(child: Divider(color: ColorManager.greyColor)),
              InkWell(
                onTap: () => controller.goodsUnitType
                    .add(GoodsUnitTypeMarineShipmentModel.nexItem()),
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
              const Expanded(child: Divider(color: ColorManager.greyColor)),
            ],
          ),
        ],
      ),
    );
  }
}
