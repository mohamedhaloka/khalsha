import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/land_shipping/data/models/land_shipping_service_model.dart';
import 'package:khalsha/features/land_shipping/land_shipping.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import '../custom_button.dart';
import '../inputs/text_field_input_with_holder.dart';

class DismantlingAndInstallationService
    extends GetView<AddEditLandShippingServiceController> {
  const DismantlingAndInstallationService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Obx(
          () => ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, int index) => Column(
              children: [
                TextFieldInputWithHolder(
                  title: 'اسم الصنف',
                  hint: itemTitle,
                  controller: controller.serviceData[index].item,
                ),
                const Divider(color: ColorManager.greyColor),
                TextFieldInputWithHolder(
                  title: 'الكمية',
                  keyboardType: TextInputType.number,
                  controller: controller.serviceData[index].quantity,
                ),
                const Divider(color: ColorManager.greyColor),
                _ServiceYouNeed(
                  pack: controller.serviceData[index].pack,
                  unPack: controller.serviceData[index].unpack,
                  packing: controller.serviceData[index].packaging,
                ),
                const Divider(color: ColorManager.greyColor),
                if (controller.serviceData.length > 1)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomButton(
                      width: 40,
                      height: 40,
                      onTap: () => controller.serviceData
                          .remove(controller.serviceData[index]),
                      imgName: 'delete',
                      backgroundColor: ColorManager.errorColor,
                    ),
                  ),
              ],
            ),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemCount: controller.serviceData.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomButton(
              height: inputHeight,
              width: 100,
              radius: radius,
              text: 'إضافة صنف أخر',
              contentColor: ColorManager.lightGreyColor,
              onTap: () => controller.serviceData
                  .add(LandShippingServiceModel.newItem()),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: CustomButton(
            height: inputHeight,
            width: Get.width,
            radius: radius,
            text: 'تأكيد',
            onTap: Get.back,
          ),
        )
      ],
    );
  }

  String get itemTitle {
    if (controller.shippingType.value == 0) return 'مثال مطبخ ٦ متر وطني';
    return 'مثال تركيب مكيفات للعملاء';
  }
}

class _ServiceYouNeed extends StatelessWidget {
  const _ServiceYouNeed(
      {required this.pack,
      required this.unPack,
      required this.packing,
      Key? key})
      : super(key: key);
  final RxBool pack, unPack, packing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الخدمات التي تحتاجها',
            style: Get.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorManager.greyColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildOption(
                      value: pack,
                      text: Services.pack.name,
                    ),
                    buildOption(
                      value: unPack,
                      text: Services.unpack.name,
                    ),
                    buildOption(
                      value: packing,
                      text: Services.packaging.name,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget buildOption({
    required RxBool value,
    required String text,
  }) =>
      InkWell(
        onTap: () {
          // if (selectedService.contains(e.name)) {
          //   selectedService.remove(e.name);
          //   return;
          // }
          // selectedService.add(e.name);
          value(!value.value);
        },
        child: Container(
          decoration: BoxDecoration(
            color: value.value ? ColorManager.primaryColor : null,
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
            border: Border.all(
              color: ColorManager.lightGreyColor,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 4,
          ),
          child: Text(
            text.tr,
            style: TextStyle(
              color: value.value ? Colors.white : null,
            ),
          ),
        ),
      );
}

enum Services {
  pack,
  unpack,
  packaging,
}
