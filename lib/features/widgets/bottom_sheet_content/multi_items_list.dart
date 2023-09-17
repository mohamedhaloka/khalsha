import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/features/widgets/cached_image.dart';

import '../../../../core/data/models/data_model.dart';
import '../../../../core/presentation/themes/colors_manager.dart';

class MultiItemsList extends StatelessWidget {
  const MultiItemsList({
    Key? key,
    required this.items,
    required this.selectedItem,
    this.onSelectItem,
  }) : super(key: key);
  final List<DataModel> items;
  final Rx<DataModel> selectedItem;
  final void Function(DataModel)? onSelectItem;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (_, int index) => InkWell(
        onTap: () {
          selectedItem(items[index]);

          Get.back();
          if (onSelectItem != null) onSelectItem!(items[index]);
        },
        child: Obx(
          () => Container(
            height: 45,
            color: selectedItem.value.id == items[index].id
                ? ColorManager.primaryColor
                : null,
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    items[index].name,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.titleSmall!.copyWith(
                      color: selectedItem.value.id == items[index].id
                          ? Colors.white
                          : null,
                    ),
                  ),
                ),
                if (items[index].icon.isNotEmpty)
                  InkWell(
                    onTap: () {
                      Get.dialog(AlertDialog(
                        content: CachedImage(
                          width: 200,
                          height: 200,
                          imgUrl: HttpService.fileBaseURL + items[index].icon,
                        ),
                      ));
                    },
                    child: CachedImage(
                      imgUrl: HttpService.fileBaseURL + items[index].icon,
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
              ],
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
