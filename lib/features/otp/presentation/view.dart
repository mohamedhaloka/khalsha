import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/otp/domain/entites/enums/verify_type.dart';
import 'package:khalsha/features/otp/presentation/widgets/otp_field.dart';
import 'package:khalsha/features/otp/presentation/widgets/resend_otp.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

import '../../../core/presentation/themes/colors_manager.dart';
import '../../widgets/custom_app_bar.dart';
import 'get/controllers/controller.dart';

class OTPView extends GetView<OTPController> {
  const OTPView({Key? key}) : super(key: key);

  String get _account {
    if (controller.verifyType == VerifyType.email) {
      return controller.userData['user']['email'];
    }
    return controller.userData['user']['mobile'];
  }

  String get _accountStr {
    if (controller.verifyType == VerifyType.email) {
      return 'بريدك الإلكتــروني';
    }
    return 'هاتفــك';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 50),
        children: [
          Text(
            'من فضلك\nتفحــص رســائل $_accountStr',
            style: Get.textTheme.titleLarge!.copyWith(
                color: ColorManager.primaryColor, fontWeight: FontWeight.bold),
          ),
          Text(
            'تم إرسال الكود إلى  $_account',
            style: Get.textTheme.titleMedium!.copyWith(
              color: ColorManager.greyColor,
            ),
          ),
          const OTPFields(),
          CustomButton.fillBlue(
            loading: controller.loading,
            onTap: controller.checkCode,
            text: 'تأكيد',
          ),
          const ResendOTP()
        ],
      ),
    );
  }
}
