import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/themes/colors_manager.dart';

class SettlementItem extends StatelessWidget {
  const SettlementItem(this.index, {Key? key}) : super(key: key);
  final int index;

  bool get isOdd => index.isOdd;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      color: isOdd ? Colors.grey[100] : Colors.grey[200],
      child: Row(
        children: [
          _detail('كود #100'),
          _detail('2000 ريال'),
          _detail(isOdd ? 'انتظار' : 'تمت'),
          _detail(
            'تسوية',
            textColor: isOdd ? ColorManager.darkTobyColor : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ],
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
