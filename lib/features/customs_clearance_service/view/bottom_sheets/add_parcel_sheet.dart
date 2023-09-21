part of '../../customs_clearance.dart';

class _ParcelSheetBody extends GetView<AddEditCustomsClearanceController> {
  const _ParcelSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        DisableForEdit(
          isDisabled: !controller.isAdd,
          child: Obx(() => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, int index) => Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomButton(
                        width: 40,
                        height: 40,
                        onTap: () =>
                            controller.parcel.remove(controller.parcel[index]),
                        imgName: 'delete',
                        backgroundColor: ColorManager.errorColor,
                      ),
                    ),
                    CustomDropDown(
                      title: 'نوع البضاعة',
                      hint: 'أختر',
                      radius: radius,
                      dropVal: controller.parcel[index].goodsType,
                      isExpanded: true,
                      source: controller.goodsTypes
                          .map((e) => DropdownMenuItem(
                                value: e.id.toString(),
                                child: Text(e.name),
                              ))
                          .toList(),
                    ),
                    CustomDropDown(
                      title: 'نوع الطرد',
                      hint: 'أختر',
                      radius: radius,
                      dropVal: controller.parcel[index].parcelType,
                      isExpanded: true,
                      onTap: (_) {
                        if (controller.parcel[index].parcelType.value ==
                            ParcelType.other.name) return;
                        controller.parcel[index].otherParcelName.text = '';
                      },
                      source: ParcelType.values
                          .map((e) => DropdownMenuItem(
                                value: e.name,
                                child: Text(e.name.tr),
                              ))
                          .toList(),
                    ),
                    Obx(
                      () => controller.parcel[index].parcelType.value ==
                              ParcelType.other.name
                          ? CustomTextField(
                              title: 'أكتب نوع الطرد',
                              radius: radius,
                              borderSide: inputBorderSide,
                              controller:
                                  controller.parcel[index].otherParcelName,
                            )
                          : const SizedBox(),
                    ),
                    CustomTextField(
                      title: 'إجمالي الحجم (متر مكعب)',
                      radius: radius,
                      borderSide: inputBorderSide,
                      controller: controller.parcel[index].totalSize,
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextField(
                      title: 'إجمالي الوزن (كيلو جرام)',
                      radius: radius,
                      borderSide: inputBorderSide,
                      controller: controller.parcel[index].totalWeight,
                      keyboardType: TextInputType.number,
                    ),
                    CustomTextField(
                      title: 'الكمية',
                      radius: radius,
                      borderSide: inputBorderSide,
                      controller: controller.parcel[index].quantity,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: controller.parcel.length,
              )),
        ),
        Row(
          children: [
            const Expanded(child: Divider()),
            DisableForEdit(
              isDisabled: !controller.isAdd,
              child: InkWell(
                onTap: () => controller.parcel.add(ParcelDataModel.newItem()),
                child: const Chip(
                  label: Text("+", style: TextStyle(color: Colors.white)),
                  backgroundColor: ColorManager.secondaryColor,
                ),
              ),
            ),
            const Expanded(child: Divider()),
          ],
        ),
        CustomButton(
          text: 'تأكيد',
          onTap: Get.back,
        )
      ],
    );
  }
}

enum ParcelType { wood, carton, roll, other }
