import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/fill_service_details/presentation/widgets/inputs/text_field_input_with_holder.dart';

class FillDataStepView extends StatelessWidget {
  const FillDataStepView({
    Key? key,
    required this.serviceName,
    required this.body,
  }) : super(key: key);
  final String serviceName;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'بيانات خدمة ${serviceName.tr}',
            style: Get.textTheme.bodyMedium!.copyWith(
              color: ColorManager.greyColor,
            ),
          ),
        ),
        const TextFieldInputWithHolder(
          title: 'عنوان الطلب',
        ),
        body
      ],
    );
  }
}
