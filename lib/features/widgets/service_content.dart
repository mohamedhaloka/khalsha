import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/presentation/themes/colors_manager.dart';
import 'custom_app_bar.dart';
import 'custom_button.dart';

class ServiceContent extends StatelessWidget {
  const ServiceContent({
    Key? key,
    required this.onTapBack,
    required this.onPageChanged,
    required this.onTapNext,
    required this.pageViewController,
    required this.pageTitle,
    required this.children,
    required this.currentStep,
    required this.btnLoading,
    this.nextTitle = 'التالي',
  }) : super(key: key);
  final String pageTitle, nextTitle;
  final void Function() onTapBack, onTapNext;
  final void Function(int index) onPageChanged;
  final List<Widget> children;
  final PageController pageViewController;
  final RxInt currentStep;
  final RxBool btnLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bgColor,
      appBar: DynamicServiceAppBar(
        pageTitle: pageTitle,
        onTapBack: onTapBack,
      ),
      body: Column(
        children: [
          StepsProgressIndicator(
            pagesLength: children.length,
            currentStep: currentStep,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: PageView(
                controller: pageViewController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: onPageChanged,
                children: children,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: CustomButton(
              onTap: onTapNext,
              loading: btnLoading,
              width: Get.width,
              height: 60,
              text: nextTitle,
            ),
          )
        ],
      ),
    );
  }
}

class DynamicServiceAppBar extends StatelessWidget with PreferredSizeWidget {
  const DynamicServiceAppBar({
    Key? key,
    required this.onTapBack,
    required this.pageTitle,
  }) : super(key: key);
  final String pageTitle;
  final void Function() onTapBack;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: pageTitle,
      backgroundColor: ColorManager.bgColor,
      onTap: onTapBack,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class StepsProgressIndicator extends StatelessWidget {
  const StepsProgressIndicator({
    Key? key,
    required this.pagesLength,
    required this.currentStep,
  }) : super(key: key);
  final int pagesLength;
  final RxInt currentStep;

  double get progressWidth =>
      (Get.width * ((currentStep.value + 1) / pagesLength));

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SvgPicture.asset(
            'assets/images/icons/truck.svg',
            color: ColorManager.secondaryColor,
            width: 30,
          ),
          Obx(
            () => AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: progressWidth,
              height: 1.5,
              color: ColorManager.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
