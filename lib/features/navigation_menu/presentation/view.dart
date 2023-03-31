import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/navigation_menu/presentation/widgets/root_app_bar.dart';

import '../../../core/presentation/themes/colors_manager.dart';
import 'get/controllers/controller.dart';
import 'menu_drawer/view.dart';

class NavigationMenuView extends GetView<NavigationMenuController> {
  const NavigationMenuView({Key? key}) : super(key: key);

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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: PageView.builder(
              reverse: true,
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (int index) => controller.currentTab(index),
              itemBuilder: (_, int index) => controller.pages[index].child!,
              itemCount: controller.pages.length,
            ),
          ),
          const _BottomTabs()
        ],
      ),
    );
  }
}

class _BottomTabs extends GetView<NavigationMenuController> {
  const _BottomTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[200]!,
              blurRadius: 3,
              spreadRadius: 6,
              offset: const Offset(0, 0))
        ],
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
                    onTap: () => controller.navigateToParticularPage(e.id),
                    child: Obx(() {
                      bool isSelected = controller.currentTab.value == e.id;
                      return Container(
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
                      );
                    }),
                  )))
              .toList(),
        ),
      ),
    );
  }
}
