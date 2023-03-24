import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/settlement/presentation/widgets/settlement_item.dart';

import 'get/controllers/controller.dart';

class SettlementView extends GetView<SettlementController> {
  const SettlementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Table(
          border: TableBorder.all(
            color: ColorManager.lightGreyColor,
            width: 1.5,
          ),
          children: [
            TableRow(
                children: ['رقم الفاتورة', 'إجمالي الفاتورة', 'الحالة', '']
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
          itemBuilder: (_, int index) => SettlementItem(index),
          itemCount: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Text(
            'يتم تسوية الفاتورة في حال تجاوزها مده لا تقل عن ثلاثين يوماً او في حال بلوغها الحد الإقصي وهو مائة ريال.',
            style: Get.textTheme.bodyText2!.copyWith(
              color: ColorManager.darkTobyColor,
            ),
          ),
        )
      ],
    );
  }
}
