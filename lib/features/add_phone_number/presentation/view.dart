import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/add_phone_number/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/widgets/custom_app_bar.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

class AddPhoneNumberView extends GetView<AddPhoneNumberController> {
  const AddPhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'إضافة رقم الهاتف',
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 50),
        children: [
          Text(
            'يجب إضافة رقم الهاتف الخاص بك',
            style: Get.textTheme.titleLarge!.copyWith(
                color: ColorManager.primaryColor, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 24),
            child: CustomTextField(
              title: 'رقم الهاتف',
              inputType: Input.phone,
              keyboardType: TextInputType.number,
              controller: controller.phone,
            ),
          ),
          CustomButton.fillBlue(
            loading: controller.loading,
            onTap: controller.updatePhoneNumber,
            text: 'تأكيد',
          ),
        ],
      ),
    );
  }
}
