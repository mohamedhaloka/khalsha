import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/otp/presentation/widgets/otp_field.dart';
import 'package:khalsha/features/otp/presentation/widgets/resend_otp.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

import '../../../core/presentation/routes/app_routes.dart';
import '../../../core/presentation/themes/colors_manager.dart';
import '../../widgets/custom_app_bar.dart';
import 'get/controllers/controller.dart';

class OTPView extends GetView<OTPController> {
  const OTPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 50),
        children: [
          Text(
            'من فضلك\nتفحــص رســائل هاتفــك',
            style: Get.textTheme.headline6!.copyWith(
                color: ColorManager.primaryColor, fontWeight: FontWeight.bold),
          ),
          Text(
            'تم إرسال الكود إلى  01141558798 02+',
            style: Get.textTheme.subtitle1!.copyWith(
              color: ColorManager.greyColor,
            ),
          ),
          const OTPFields(),
          CustomButton.fillBlue(
            onTap: () => Get.offAllNamed(Routes.navigationMenu),
            text: 'تأكيد',
          ),
          const ResendOTP()
        ],
      ),
    );
  }
}
