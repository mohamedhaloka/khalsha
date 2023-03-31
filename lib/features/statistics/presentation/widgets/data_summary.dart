import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/widgets/table_items.dart';

import '../../../../core/data/models/item_model.dart';
import '../../../../core/presentation/themes/colors_manager.dart';

class DataSummary extends StatelessWidget {
  const DataSummary({
    Key? key,
    required this.selectedFilter,
    required this.filters,
  }) : super(key: key);
  final RxInt selectedFilter;
  final List<ItemModel> filters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: 12),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 6.0,
            mainAxisSpacing: 6.0,
            childAspectRatio: 3,
          ),
          itemCount: filters.length,
          itemBuilder: (context, index) => SizedBox(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Obx(() {
                  int id = filters[index].id ?? 0;
                  bool isSelected = selectedFilter.value == id;
                  return InkWell(
                    onTap: () => selectedFilter(id),
                    child: Container(
                      height: 30,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          color: isSelected ? ColorManager.primaryColor : null,
                          border:
                              Border.all(color: ColorManager.lightGreyColor)),
                      child: Center(
                        child: Text(
                          filters[index].text,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.bodySmall!.copyWith(
                            color: isSelected
                                ? Colors.white
                                : ColorManager.greyColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                Positioned(
                  top: 0,
                  left: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: ColorManager.secondaryColor,
                    child: Text(
                      filters[index].description ?? '',
                      style: Get.textTheme.labelMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        TableItems(
          itemsHeader: const ['الطلب', 'بواسطة', 'تاريخ الإضافة'],
          itemsBody: const ['نقل أخشاب', 'شركة الرياض', '12/12/2022'],
          onItemTapped: () {},
        )
      ],
    );
  }
}
