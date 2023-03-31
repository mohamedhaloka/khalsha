import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors_manager.dart';
import '../../../widgets/custom_button.dart';
import '../inputs_style.dart';

class ChooseCertificates extends StatefulWidget {
  const ChooseCertificates({Key? key}) : super(key: key);

  @override
  State<ChooseCertificates> createState() => _ChooseCertificatesState();
}

class _ChooseCertificatesState extends State<ChooseCertificates> {
  List<List> certificates = <List>[
    ['شهادة سايبر', true],
    ['شهادة الغذاء و الدواء', true],
    ['شهادة المطابقة السعودية', true],
    ['شهادة المطابقة الخارجية', true],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            'حدد الشهادات المراد إستخراجها',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorManager.greyColor,
            ),
          ),
        ),
        ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          itemBuilder: (_, int index) => _buildCheckBox(
            certificates[index][1],
            certificates[index][0],
          ),
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemCount: 4,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        const Divider(
          color: ColorManager.greyColor,
        ),
        const SizedBox(height: 10),
        Center(
          child: CustomButton(
            height: inputHeight,
            width: 100,
            radius: radius,
            text: 'تأكيد',
            onTap: () {
              Get.back(result: true);
            },
          ),
        )
      ],
    );
  }

  Widget _buildCheckBox(
    bool value,
    String text,
  ) =>
      Row(
        children: [
          SizedBox(
            width: 10,
            height: 10,
            child: Checkbox(
              value: value,
              onChanged: (bool? v) {
                value = v ?? false;
                setState(() {});
              },
              activeColor: ColorManager.primaryColor,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            text,
            style: Get.textTheme.bodyMedium!.copyWith(
              color: ColorManager.greyColor,
            ),
          )
        ],
      );
}
