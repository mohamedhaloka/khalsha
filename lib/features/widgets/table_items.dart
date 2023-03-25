import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/routes/app_routes.dart';

import '../../core/themes/colors_manager.dart';

class TableItems extends StatelessWidget {
  const TableItems({
    Key? key,
    required this.itemsHeader,
    required this.onItemTapped,
    this.onNextTapped,
    this.onBackTapped,
  }) : super(key: key);
  final List<String> itemsHeader;
  final void Function() onItemTapped;
  final void Function()? onNextTapped, onBackTapped;

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
                              style: Get.textTheme.caption!.copyWith(
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
          itemBuilder: (_, int index) => _TableItem(
            index,
            onItemTapped: onItemTapped,
          ),
          itemCount: 20,
        ),
        if (onBackTapped != null && onNextTapped != null) ...[
          const Divider(
            height: 0,
            thickness: 1,
            color: ColorManager.lightGreyColor,
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(
              color: ColorManager.lightGreyColor,
            ))),
            child: Row(
              children: [
                InkWell(onTap: onNextTapped, child: const Text('السابق')),
                const Expanded(
                    child: Text(
                  'صفحة 1 من 5',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
                InkWell(onTap: onBackTapped, child: const Text('التالي')),
              ],
            ),
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: ColorManager.lightGreyColor,
          ),
        ]
      ],
    );
  }
}

class _TableItem extends StatelessWidget {
  const _TableItem(
    this.index, {
    Key? key,
    required this.onItemTapped,
  }) : super(key: key);
  final int index;
  final void Function() onItemTapped;

  bool get isOdd => index.isOdd;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onItemTapped,
      child: Container(
        height: 35,
        color: isOdd ? Colors.grey[100] : Colors.grey[200],
        child: Row(
          children: [
            _detail('كود #100'),
            _detail('2000 ريال'),
            _detail(isOdd ? 'انتظار' : 'تمت'),
            _detail(
              Get.currentRoute == Routes.orderDetails ? 'عرض' : 'تسوية',
              textColor: Get.currentRoute == Routes.orderDetails
                  ? ColorManager.darkTobyColor
                  : isOdd
                      ? ColorManager.darkTobyColor
                      : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }

  Widget _detail(String text, {Color? textColor, FontWeight? fontWeight}) =>
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Get.textTheme.button!.copyWith(
              color: textColor,
              fontWeight: fontWeight,
            ),
          ),
        ),
      );
}