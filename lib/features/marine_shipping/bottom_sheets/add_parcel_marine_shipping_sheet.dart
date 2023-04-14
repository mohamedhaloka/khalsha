part of '../marine_shipping.dart';

class _ParcelMarineShippingSheet extends StatelessWidget {
  const _ParcelMarineShippingSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Divider(
          color: ColorManager.greyColor,
        ),
        const TextFieldInputWithHolder(
          title: 'وصف البضاعة',
        ),
        const Divider(
          color: ColorManager.greyColor,
        ),
        const TextFieldInputWithHolder(
          title: 'نوع الحاوية',
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
        const AttachFileWithHolder(
          title: 'صورة الشحنة',
        ),
        const Divider(
          color: ColorManager.greyColor,
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
