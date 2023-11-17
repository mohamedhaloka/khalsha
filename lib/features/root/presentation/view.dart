import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/source/local/user_local.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/auth/presentation/get/controllers/auth_controller.dart';
import 'package:khalsha/features/otp/domain/entites/enums/verify_type.dart';
import 'package:khalsha/features/otp/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/root/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/root/presentation/menu_drawer/view.dart';
import 'package:khalsha/features/root/presentation/widgets/root_app_bar.dart';
import 'package:khalsha/features/widgets/custom_rich_text.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      endDrawer: const MenuDrawerView(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: Obx(
          () => RootAppBar(
            scaffoldKey: controller.scaffoldKey,
            text: controller.pageTitle,
          ),
        ),
      ),
      body: Column(
        children: [
          const _NeedVerifyAccount(),
          Expanded(
            child: Obx(() => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: PageView.builder(
                        reverse: true,
                        controller: controller.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (int index) =>
                            controller.currentTab(index),
                        itemBuilder: (_, int index) =>
                            controller.pages[index].child!,
                        itemCount: controller.pages.length,
                      ),
                    ),
                    const _BottomTabs(),
                    if (controller.loading.value)
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 5.0,
                          sigmaY: 5.0,
                        ),
                        child: Container(
                          color: Colors.transparent,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class _BottomTabs extends GetView<RootController> {
  const _BottomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: Get.width,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: Row(
          children: controller.pages
              .map((e) => Expanded(
                      child: InkWell(
                    onTap: () => controller.navigateToParticularPage(e.id!),
                    child: Obx(() {
                      bool isSelected = controller.currentTab.value == e.id;
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned.fill(
                              child: Container(
                            color: isSelected
                                ? ColorManager.primaryColor
                                : Colors.white,
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Expanded(
                                  child: SvgPicture.asset(
                                    'assets/images/navigation_menu/${e.image}.svg',
                                    color: isSelected
                                        ? Colors.white
                                        : ColorManager.greyColor,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    e.text,
                                    style: Get.textTheme.bodySmall!.copyWith(
                                        color: isSelected
                                            ? Colors.white
                                            : ColorManager.greyColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )
                              ],
                            ),
                          )),
                          if (e.id == 3 &&
                              controller.unSeenNotificationCount.value >= 1)
                            Positioned(
                              top: 6,
                              right: 24,
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: ColorManager.errorColor,
                                child: Text(
                                  controller.unSeenNotificationCount.value > 9
                                      ? '+9'
                                      : controller
                                          .unSeenNotificationCount.string,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ),
                        ],
                      );
                    }),
                  )))
              .toList(),
        ),
      ),
    );
  }
}

class _NeedVerifyAccount extends GetView<RootController> {
  const _NeedVerifyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          height: controller.needToVerifyAccount ? 50 : 0,
          duration: const Duration(milliseconds: 1200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: controller.needToVerifyAccount
              ? CustomRichText(
                  text: controller.errorMessage,
                  subText: '    تفعيل من هنا',
                  subTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  onTap: () {
                    VerifyType? verifyType;
                    switch (controller.authStatus.value) {
                      case AuthStatus.verifyPhone:
                        verifyType = VerifyType.mobile;
                        break;
                      case AuthStatus.verifyEmail:
                        verifyType = VerifyType.email;
                        break;
                      default:
                        return;
                    }
                    Get.offAllNamed(
                      Routes.otp,
                      arguments: {
                        kUserData: UserDataLocal.instance.data.value.toJson(),
                        kVerifyType: verifyType,
                        kRequestResendCode: true,
                      },
                    );
                  },
                )
              : const SizedBox(),
        ));
  }
}
