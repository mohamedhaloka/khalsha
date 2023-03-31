import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/navigation_menu/presentation/get/controllers/controller.dart';

import '../../../../core/data/models/item_model.dart';
import '../../../../core/presentation/themes/colors_manager.dart';

class MenuItems extends GetView<NavigationMenuController> {
  const MenuItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 25),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, int index) => _MenuItem(controller.menu[index]),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemCount: controller.menu.length);
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem(this.item, {Key? key}) : super(key: key);
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (item.route == null) return;
        Get.toNamed(
          item.route!,
          arguments: item.arguments,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        child: Row(
          children: [
            SvgPicture.asset('assets/images/icons/${item.image}.svg'),
            const SizedBox(width: 22),
            Expanded(
                child: Text(
              item.text,
              style: Get.textTheme.subtitle2!.copyWith(
                color: ColorManager.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
