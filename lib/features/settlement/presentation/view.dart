import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/widgets/table_items.dart';

import '../../../core/routes/app_routes.dart';
import 'get/controllers/controller.dart';

class SettlementView extends GetView<SettlementController> {
  const SettlementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        TableItems(
          onItemTapped: () => Get.toNamed(Routes.settlementDetails),
          itemsHeader: const ['رقم الفاتورة', 'إجمالي الفاتورة', 'الحالة', ''],
          itemsBody: const ['كود #200', '2000 ريال', 'إنتظار', 'تسوية'],
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
