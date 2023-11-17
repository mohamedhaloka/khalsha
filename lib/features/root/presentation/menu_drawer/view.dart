import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/root/presentation/get/controllers/controller.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/root/presentation/menu_drawer/menu_header.dart';
import 'package:khalsha/features/root/presentation/menu_drawer/menu_items.dart';

class MenuDrawerView extends GetView<RootController> {
  const MenuDrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        bottomRight: Radius.circular(16),
      )),
      child: ListView(
        children: [
          const MenuHeader(),
          const MenuItems(),
          InkWell(
            onTap: controller.showLogOutDialog,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/icons/sign-out.svg'),
                const SizedBox(width: 6),
                Text(
                  'تسجيل خروج',
                  style: Get.textTheme.titleMedium!.copyWith(
                    color: ColorManager.darkTobyColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
