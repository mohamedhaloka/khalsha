import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/home/presentation/get/controllers/controller.dart';
import 'package:khalsha/main.dart';

import '../../../../core/presentation/themes/colors_manager.dart';

class HomeHeader extends GetView<HomeController> {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            provider ? 'تقدم بخدماتك المتنوعة' : 'جميع الخدمات اللوجيستية',
            style: Get.textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorManager.primaryColor,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 2,
                  color: ColorManager.primaryColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'في مكان واحد',
                  style: Get.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 2,
                  color: ColorManager.primaryColor,
                ),
              ),
            ],
          ),
          SvgPicture.asset('assets/images/icons/title-header2.svg')
        ],
      ),
    );
  }
}
