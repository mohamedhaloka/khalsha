import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

import '../../../core/routes/app_routes.dart';
import '../../widgets/back_icon.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/stylish_text.dart';
import 'get/controllers/controller.dart';

class ServiceIntroView extends GetView<ServiceIntroController> {
  const ServiceIntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.skyBGColor,
      body: ListView(
        children: [
          Image.asset(
            'assets/images/services/${controller.serviceType.value}-big.png',
            width: Get.width,
            fit: BoxFit.fill,
            // height: Get.height / .5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                TextDash(
                  controller.serviceType.value,
                ),
                const SizedBox(height: 20),
                Column(
                  children: controller.options
                      .map((item) => Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 18,
                            ),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: SvgPicture.asset(
                                      'assets/images/icons/${item.image}.svg'),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    item.text,
                                    style: Get.textTheme.subtitle1!.copyWith(
                                      color: ColorManager.primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: CustomButton(
                          onTap: () => Get.toNamed(
                            Routes.fillServiceDetails,
                            arguments: controller.serviceType,
                          ),
                          height: 38,
                          width: 140,
                          text: 'بداية الخدمة',
                        ),
                      ),
                    ),
                    const BackIconButton(),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
