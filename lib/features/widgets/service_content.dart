import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/steps_progress_indicator.dart';

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
