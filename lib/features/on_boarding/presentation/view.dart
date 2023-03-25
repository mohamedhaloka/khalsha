import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/on_boarding/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

import '../../widgets/custom_app_bar.dart';
import '../../widgets/stylish_text.dart';
import '../data/models/on_boarding_item_model.dart';

class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        onTap: controller.onReachEnd,
        title: controller.pageTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemBuilder: (_, int index) => _OnBoardingItemView(
                  controller.slides[index],
                ),
                onPageChanged: (int index) => controller.currentPage(index),
                itemCount: controller.slides.length,
              ),
            ),
            Obx(() => CustomButton(
                  width: screenSize.width,
                  onTap: controller.goNext,
                  text: controller.btnText,
                ))
          ],
        ),
      ),
    );
  }
}

class _OnBoardingItemView extends StatelessWidget {
  const _OnBoardingItemView(this.onBoardingItem, {Key? key}) : super(key: key);
  final OnBoardingItemModel onBoardingItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: SvgPicture.asset(
              'assets/images/on_boarding/${onBoardingItem.image}.svg',
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 0, 16),
                child: TextUnderline(
                  onBoardingItem.title,
                ),
              ),
              Text(
                onBoardingItem.subTitle,
                textAlign: TextAlign.center,
                style: Get.textTheme.button,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
