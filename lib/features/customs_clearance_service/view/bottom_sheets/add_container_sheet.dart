part of '../../customs_clearance.dart';

class _ContainerSheetBody extends GetView<AddEditCustomsClearanceController> {
  const _ContainerSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Obx(() => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) => Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomButton(
                      width: 40,
                      height: 40,
                      onTap: () => controller.container
                          .remove(controller.container[index]),
                      imgName: 'delete',
                      backgroundColor: ColorManager.errorColor,
                    ),
                  ),
                  CustomDropDown(
                    title: 'نوع البضاعة',
                    hint: 'أختر',
                    radius: radius,
                    dropVal: controller.container[index].goodsType,
                    isExpanded: true,
                    source: controller.goodsTypes
                        .map((e) => DropdownMenuItem(
                              value: e.id.toString(),
                              child: Text(e.name),
                            ))
                        .toList(),
                  ),
                  CustomDropDown(
                    title: 'نوع الحاوية',
                    hint: 'أختر',
                    radius: radius,
                    dropVal: controller.container[index].containerType,
                    isExpanded: true,
                    source: ContainerType.values
                        .map((e) => DropdownMenuItem(
                              value: e.name,
                              child: Text(e.name.tr),
                            ))
                        .toList(),
                  ),
                  CustomDropDown(
                    title: 'حجم الحاوية',
                    hint: 'أختر',
                    radius: radius,
                    dropVal: controller.container[index].containerSize,
                    isExpanded: true,
                    source: ContainerSize.values
                        .map((e) => DropdownMenuItem(
                              value: e.value,
                              child: Text(e.name.tr),
                            ))
                        .toList(),
                  ),
                  CustomTextField(
                    title: 'عدد الحاويات',
                    radius: radius,
                    borderSide: inputBorderSide,
                    controller: controller.container[index].containerCount,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: controller.container.length,
            )),
        Row(
          children: [
            const Expanded(child: Divider()),
            InkWell(
              onTap: () =>
                  controller.container.add(ContainerDataModel.newItem()),
              child: const Chip(
                label: Text("+", style: TextStyle(color: Colors.white)),
                backgroundColor: ColorManager.secondaryColor,
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

enum ContainerType {
  refrigerated('refrigerated'),
  dry('dry'),
  openRoof('open_roof'),
  flat('flat'),
  collapsible('collapsible');

  final String value;
  const ContainerType(this.value);
}

enum ContainerSize {
  fit20('20_feet'),
  fit40('40_feet');

  final String value;
  const ContainerSize(this.value);
}
