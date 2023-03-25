import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/models/item_model.dart';
import 'package:khalsha/core/routes/app_routes.dart';
import 'package:khalsha/core/themes/colors_manager.dart';
import 'package:khalsha/features/order_details/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/order_details/presentation/widgets/order_tab_header.dart';
import 'package:khalsha/features/widgets/custom_button.dart';
import 'package:khalsha/main.dart';

import '../../widgets/bill.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/stylish_text.dart';
import '../../widgets/table_items.dart';

part 'tabs/bill_data.dart';
part 'tabs/order_data.dart';
part 'tabs/pricing_offers.dart';
part 'tabs/status_data.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (Get.previousRoute != Routes.orders) ...[
              const _DetailsTabs(),
            ],
            Expanded(
              child: PageView(
                controller: controller.pageViewController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int index) => controller.currentTab(index),
                children: [
                  const _OrderDataTab(),
                  if (provider) ...[
                    const _BillDataTab(),
                  ] else ...[
                    const _PricingOffersTab(),
                  ],
                  const _StatusData(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsTabs extends GetView<OrderDetailsController> {
  const _DetailsTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            _tabWidget(id: 0, imgName: 'data'),
            _separator,
            _tabWidget(id: 1, imgName: 'bill'),
            _separator,
            _tabWidget(id: 2, imgName: 'track'),
          ],
        ));
  }

  Widget _tabWidget({
    required int id,
    required String imgName,
  }) =>
      InkWell(
        onTap: () => controller.goToParticularPage(id),
        child: CircleAvatar(
          radius: controller.currentTab.value == id ? 22 : 18,
          backgroundColor: controller.currentTab.value == id
              ? ColorManager.primaryColor
              : ColorManager.lightGreyColor,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: SvgPicture.asset(
              'assets/images/order_details/$imgName.svg',
              color: controller.currentTab.value == id
                  ? Colors.white
                  : ColorManager.greyColor,
            ),
          ),
        ),
      );

  Widget get _separator => Expanded(
          child: Container(
        height: 1,
        color: ColorManager.lightGreyColor,
      ));
}
