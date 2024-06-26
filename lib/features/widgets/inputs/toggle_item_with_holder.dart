import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/data/models/item_model.dart';
import '../../../../../core/presentation/themes/colors_manager.dart';
import '../../../core/inputs_style.dart';
import 'input_holder_box.dart';

class ToggleItemWithHolder extends StatelessWidget {
  const ToggleItemWithHolder({
    Key? key,
    this.errorMsg,
    this.title,
    this.onChooseItem,
    this.toolTipMsg,
    this.enableSelect = true,
    required this.items,
    required this.selectedItem,
  }) : super(key: key);
  final String? title, errorMsg, toolTipMsg;
  final RxInt selectedItem;
  final bool enableSelect;
  final List<ItemModel> items;
  final void Function(ItemModel itemModel)? onChooseItem;

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
            const SizedBox(width: 8),
            if (toolTipMsg != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 12, 0),
                child: Tooltip(
                  message: toolTipMsg,
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
                  onChooseItem: onChooseItem,
                  enableSelect: enableSelect,
                ),
                const SizedBox(width: 10),
                _Item(
                  item: items[1],
                  selectedItem: selectedItem,
                  onChooseItem: onChooseItem,
                  enableSelect: enableSelect,
                ),
              ],
            ),
          ),
        ],
      ),
      errorText: errorMsg,
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.selectedItem,
    required this.item,
    this.onChooseItem,
    this.enableSelect = true,
  }) : super(key: key);
  final ItemModel item;
  final RxInt selectedItem;
  final void Function(ItemModel itemModel)? onChooseItem;
  final bool enableSelect;

  bool get isSelected => item.id == selectedItem.value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          if (enableSelect) {
            selectedItem(item.id);
          }
          if (onChooseItem != null) onChooseItem!(item);
        },
        child: Obx(() => Container(
              height: inputHeight,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: isSelected ? ColorManager.primaryColor : null,
                borderRadius: const BorderRadius.all(Radius.circular(radius)),
                border: Border.all(color: ColorManager.lightGreyColor),
              ),
              child: Center(
                child: Text(
                  item.text,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodySmall!.copyWith(
                    color: isSelected ? Colors.white : null,
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
