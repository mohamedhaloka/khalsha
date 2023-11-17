import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:khalsha/core/presentation/themes/colors_manager.dart';

class TableItems extends StatelessWidget {
  const TableItems({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.itemsHeader,
    required this.onItemTapped,
  }) : super(key: key);
  final int itemCount;
  final List<String> itemsHeader;
  final Widget Function(int) itemBuilder;
  final void Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder.all(
            color: ColorManager.lightGreyColor,
          ),
          children: [
            TableRow(
                children: itemsHeader
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Center(
                            child: Text(
                              e,
                              style: Get.textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ))
                    .toList()),
          ],
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) => InkWell(
            onTap: () => onItemTapped(index),
            child: Container(
              height: 35,
              color: index.isOdd ? Colors.grey[100] : Colors.grey[200],
              child: itemBuilder(index),
            ),
          ),
          itemCount: itemCount,
        ),
      ],
    );
  }
}
