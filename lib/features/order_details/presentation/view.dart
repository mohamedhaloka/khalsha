import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/order_details/data/models/order_details_item_model.dart';
import 'package:khalsha/features/order_details/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/order_details/presentation/widgets/order_tab_header.dart';
import 'package:khalsha/features/order_details/presentation/widgets/status_steps.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/widgets/custom_button.dart';

import '../../../core/presentation/themes/colors_manager.dart';
import '../../orders/domain/entities/order_model.dart';
import '../../widgets/bill.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/stylish_text.dart';

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
        child: Obx(() => controller.loading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Get.theme.primaryColor,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const _DetailsTabs(),
                  Expanded(
                    child: PageView(
                      controller: controller.pageViewController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (int index) =>
                          controller.currentTab(index),
                      children: [
                        const _OrderDataTab(),
                        const _PricingOffersTab(),
                        if (controller.serviceType ==
                            ServiceTypes.customsClearance)
                          const _StatusData(),
                        const _BillDataTab(),
                      ],
                    ),
                  ),
                ],
              )),
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
            if (controller.orderModel.offer == null) ...[
              _separator,
              _tabWidget(id: 1, imgName: 'pricing-offers'),
            ],
            if (controller.serviceType == ServiceTypes.customsClearance) ...[
              _separator,
              _tabWidget(id: 2, imgName: 'track'),
            ],
            _separator,
            _tabWidget(id: 3, imgName: 'bill'),
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
