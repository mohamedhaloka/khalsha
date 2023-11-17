import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/intro/presentation/get/controllers/controller.dart';

import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/widgets/custom_app_bar.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

class IntroView extends GetView<IntroController> {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: SizedBox(
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset('assets/images/icons/intro.svg'),
                    Text(
                      'انضم لعائلة خلصها',
                      style: Get.textTheme.headlineSmall!.copyWith(
                          color: ColorManager.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'استمتع بخدمات خلصها المتعددة\nفي المجال اللوجستي',
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton.fillBlue(
              width: Get.width,
              onTap: () => Get.offAllNamed(Routes.login),
              text: 'الدخول',
            ),
            const SizedBox(
              height: 12,
            ),
            CustomButton(
              width: Get.width,
              onTap: () => Get.offAllNamed(Routes.register),
              text: 'إنشاء حساب جديد',
            )
          ],
        ),
      ),
    );
  }
}
