import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/features/my_bills/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/orders/domain/entities/order_model.dart';
import 'package:khalsha/features/orders/presentation/widgets/filter.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';
import 'package:khalsha/features/widgets/services_filtration_sheet.dart';
import 'package:khalsha/features/widgets/smart_refresh.dart';

class MyBillsView extends GetView<MyBillsController> {
  const MyBillsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresh(
      controller: controller.refreshController,
      onLoading: controller.onLoading,
      onRefresh: controller.onRefresh,
      footer: true,
      child: ListView(
        children: [
          Obx(() => Filter(
                margin: const EdgeInsets.all(20),
                onTap: () => Get.bottomSheet(
                  HeadLineBottomSheet(
                    bottomSheetTitle: 'اختر الخدمة',
                    body: ServicesFiltrationSheet(
                      selectedService: controller.selectedService,
                      onDoneTapped: () {
                        Get.back();
                        controller.onRefresh();
                      },
                    ),
                    height: 200,
                  ),
                ),
                selectedService:
                    ServiceTypes.values[controller.selectedService.value].value,
              )),
          const _Header(),
          Obx(
            () => controller.loading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.secondaryColor,
                    ),
                  )
                : Obx(
                    () => ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, int index) => _MyBillItem(
                        controller.orders[index],
                        serviceType: ServiceTypes
                            .values[controller.selectedService.value],
                      ),
                      separatorBuilder: (_, __) => const Divider(height: 0),
                      itemCount: controller.orders.length,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      color: ColorManager.lightGrey2Color,
      child: Row(
        children: [
          _buildColumnHeader('رقم الفاتورة'),
          _buildColumnHeader('إجمالي الفاتورة'),
          _buildColumnHeader('عنوان الطلب'),
          _buildColumnHeader('بواسطة'),
        ],
      ),
    );
  }

  Widget _buildColumnHeader(String text) => Expanded(
        child: Text(
          text,
          style: Get.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorManager.secondaryColor,
          ),
        ),
      );
}

class _MyBillItem extends StatelessWidget {
  const _MyBillItem(
    this.bill, {
    Key? key,
    required this.serviceType,
  }) : super(key: key);
  final OrderModel bill;
  final ServiceTypes serviceType;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.orderDetails,
        arguments: {
          'orderId': bill.id,
          'serviceType': serviceType,
          'isBill': true,
          'showOffers': false,
        },
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            _buildRowItem(bill.id.toString()),
            _buildRowItem('${bill.invoice?.total ?? ''} ${'riyal_saudi'.tr}'),
            _buildRowItem(
              bill.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildRowItem((bill.invoice?.user?.name ?? '').toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildRowItem(String text, {TextStyle? style}) => Expanded(
        child: Text(
          text,
          style: style ??
              Get.textTheme.bodySmall!.copyWith(
                color: Colors.black,
              ),
        ),
      );
}
