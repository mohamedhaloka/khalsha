import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';

import '../../../core/presentation/themes/colors_manager.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_button.dart';
import 'get/controllers/controller.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'نسيت كلمة المرور',
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'من فضلك\nقم بكتابة رقم الهاتف أو البريد الإلكتروني',
            style: Get.textTheme.headline6!.copyWith(
              color: ColorManager.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: CustomTextField(
              title: 'البريد الإلكتروني أو رقم الهاتف',
              controller: controller.account,
            ),
          ),
          CustomButton.fillBlue(
            loading: controller.loading,
            onTap: controller.resetAccount,
            text: 'تأكيد',
          ),
        ],
      ),
    );
  }
}
