import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/login/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/widgets/custom_rich_text.dart';
import 'package:khalsha/features/widgets/custom_text_field.dart';
import 'package:khalsha/main.dart';

import '../../../core/routes/app_routes.dart';
import '../../widgets/custom_button.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 40),
            child: Text(
              'اهلا بك في خلصها !',
              style: Get.textTheme.headline6!.copyWith(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomTextField(
            title: 'البريد الإلكتروني',
          ),
          const SizedBox(height: 10),
          CustomTextField(
            title: 'كلمة المرور',
            inputType: Input.password,
            passSecure: controller.passSecure,
          ),
          const SizedBox(height: 10),
          const Text('نسيت كلمة المرور'),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 35, 0, 35),
            child: CustomButton.fillBlue(
              width: Get.width,
              onTap: () {
                provider = false;
                Get.toNamed(Routes.otp);
              },
              text: 'الدخول',
            ),
          ),
          Row(
            children: const [
              Expanded(child: Divider(color: ColorManager.greyColor)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text('الدخول بواسطة'),
              ),
              Expanded(child: Divider(color: ColorManager.greyColor)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 35),
            child: Row(
              children: controller.socials
                  .map((e) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: CustomButton(
                            height: 50,
                            onTap: () {},
                            text: e.text,
                            imgName: e.image,
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          CustomRichText(
            text: 'ليس لديك حساب حالياً؟ ',
            subText: 'التسجيل',
            onTap: () => Get.offAllNamed(Routes.register),
          )
        ],
      ),
    );
  }
}
