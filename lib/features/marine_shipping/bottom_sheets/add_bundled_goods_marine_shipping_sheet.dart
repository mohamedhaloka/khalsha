part of '../marine_shipping.dart';

class _BundledGoodsMarineShippingSheet
    extends GetView<AddEditMarineShippingServiceController> {
  const _BundledGoodsMarineShippingSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        ListView.separated(
          itemBuilder: (_, int index) => Column(
            children: [
              const TextFieldInputWithHolder(
                title: 'وصف البضاعة',
              ),
              const Divider(
                color: ColorManager.greyColor,
              ),
              ToggleItemWithHolder(
                title: 'نوع الطرد',
                items: marinePackageTypeOptions,
                selectedItem: controller.selectedMarineOrderSize,
              ),
              const Divider(
                color: ColorManager.greyColor,
              ),
              ChooseNumberWithHolder(
                title: 'عدد الحاويات',
                currentNumber: 0.obs,
              ),
              const Divider(
                color: ColorManager.greyColor,
              ),
              const Text(
                'ابعاد الشحنة بالسم',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hint: 'طول',
                        padding: EdgeInsets.zero,
                        height: inputHeight,
                        radius: radius,
                        textAlign: TextAlign.center,
                        contentPadding: contentPadding,
                        borderSide: inputBorderSide,
                        contentColor: contentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: CustomTextField(
                          hint: 'عرض',
                          padding: EdgeInsets.zero,
                          height: inputHeight,
                          radius: radius,
                          textAlign: TextAlign.center,
                          contentPadding: contentPadding,
                          borderSide: inputBorderSide,
                          contentColor: contentColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        hint: 'ارتفاع',
                        padding: EdgeInsets.zero,
                        height: inputHeight,
                        radius: radius,
                        textAlign: TextAlign.center,
                        contentPadding: contentPadding,
                        borderSide: inputBorderSide,
                        contentColor: contentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: ColorManager.greyColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          'الوزن',
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.greyColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            hint: '0',
                            padding: EdgeInsets.zero,
                            height: inputHeight,
                            radius: radius,
                            textAlign: TextAlign.center,
                            contentPadding: contentPadding,
                            borderSide: inputBorderSide,
                            contentColor: contentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )),
                    const SizedBox(width: 20),
                    Expanded(
                        child: Row(
                      children: [
                        Text(
                          'الحجم',
                          style: Get.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorManager.greyColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextField(
                            hint: '0',
                            padding: EdgeInsets.zero,
                            height: inputHeight,
                            radius: radius,
                            textAlign: TextAlign.center,
                            contentPadding: contentPadding,
                            borderSide: inputBorderSide,
                            contentColor: contentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              ),
              const Divider(
                color: ColorManager.greyColor,
              ),
              const AttachFileWithHolder(
                title: 'صورة الشحنة',
              ),
            ],
          ),
          separatorBuilder: (_, __) => Divider(
            color: Get.theme.primaryColor,
          ),
          itemCount: 1,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: ColorManager.greyColor,
              ),
            ),
            Chip(
              label: const Text(
                'إضافة طرد أخر+',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              backgroundColor: Get.theme.primaryColor,
            ),
            const Expanded(
              child: Divider(
                color: ColorManager.greyColor,
              ),
            ),
          ],
        ),
        Center(
          child: CustomButton(
            height: inputHeight,
            width: 100,
            radius: radius,
            text: 'تأكيد',
            onTap: () {
              Get.back();
            },
          ),
        )
      ],
    );
  }
}
