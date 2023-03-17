import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/models/item_model.dart';
import '../../../../core/themes/colors_manager.dart';

class MultiItemsList extends StatelessWidget {
  const MultiItemsList({
    Key? key,
    required this.items,
    required this.selectedItem,
  }) : super(key: key);
  final List<ItemModel> items;
  final Rx<ItemModel> selectedItem;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (_, int index) => InkWell(
        onTap: () => selectedItem(items[index]),
        child: Obx(
          () => Container(
            height: 45,
            color: selectedItem.value.id == items[index].id
                ? ColorManager.primaryColor
                : null,
            alignment: Alignment.center,
            child: Text(
              items[index].text,
              textAlign: TextAlign.center,
              style: Get.textTheme.titleSmall!.copyWith(
                color: selectedItem.value.id == items[index].id
                    ? Colors.white
                    : null,
              ),
            ),
          ),
        ),
      ),
      separatorBuilder: (_, __) => const Divider(
        height: 0,
        color: ColorManager.lightGreyColor,
      ),
      itemCount: items.length,
    );
  }
}
