import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';

import '../../../../../core/models/item_model.dart';
import '../../inputs_style.dart';
import 'input_holder_box.dart';

class ToggleItemWithHolder extends StatelessWidget {
  const ToggleItemWithHolder({
    Key? key,
    this.title,
    required this.items,
    required this.selectedItem,
  }) : super(key: key);
  final String? title;
  final RxInt selectedItem;
  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return InputHolderBox(
      Row(
        children: [
          if (title != null) ...[
            Text(
              title ?? '',
              style: Get.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: ColorManager.greyColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset('assets/images/icons/info.svg'),
              ),
            ),
          ],
          Expanded(
            child: Row(
              children: [
                _Item(
                  item: items[0],
                  selectedItem: selectedItem,
                ),
                const SizedBox(width: 10),
                _Item(
                  item: items[1],
                  selectedItem: selectedItem,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.selectedItem,
    required this.item,
  }) : super(key: key);
  final ItemModel item;
  final RxInt selectedItem;

  bool get isSelected => item.id == selectedItem.value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => selectedItem(item.id),
        child: Obx(() => Container(
              height: inputHeight,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isSelected ? ColorManager.primaryColor : null,
                borderRadius: const BorderRadius.all(Radius.circular(radius)),
                border: Border.all(color: ColorManager.lightGreyColor),
              ),
              child: Text(
                item.text,
                textAlign: TextAlign.center,
                style: Get.textTheme.bodySmall!.copyWith(
                  color: isSelected ? Colors.white : null,
                ),
              ),
            )),
      ),
    );
  }
}
