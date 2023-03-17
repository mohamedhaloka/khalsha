import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

import 'back_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    Key? key,
    this.onTap,
    this.title,
    this.backgroundColor,
  }) : super(key: key);
  final void Function()? onTap;
  final String? title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      leadingWidth: 0,
      title: Text(
        title ?? '',
        style: Get.textTheme.headlineSmall!.copyWith(
          color: ColorManager.secondaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 8),
          child: Center(
            child: BackIconButton(
              onTap: onTap,
            ),
          ),
        )
      ],
      toolbarHeight: 80,
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
