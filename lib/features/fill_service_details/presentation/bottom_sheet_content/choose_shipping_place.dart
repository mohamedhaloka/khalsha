import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/drop_down_input_with_holder.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../widgets/custom_button.dart';
import '../inputs_style.dart';

class ChooseShippingPlace extends StatelessWidget {
  const ChooseShippingPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Divider(
          color: ColorManager.greyColor,
        ),
        DropDownInputWithHolder(
          title: 'موقع الشحنة',
          source: [
            'ميناء',
            'مصنع',
            'مستودع',
          ].obs,
        ),
        const Divider(
          color: ColorManager.greyColor,
        ),
        DropDownInputWithHolder(
          title: 'المدينة',
          source: [
            'دبي',
            'الإمارات',
            'قطر',
            'الكويت',
          ].obs,
        ),
        const Divider(
          color: ColorManager.greyColor,
        ),
        DropDownInputWithHolder(
          title: 'الدولة',
          source: [
            'جمهورية مصر العربية',
            'المملكة العربية السعودية',
          ].obs,
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
