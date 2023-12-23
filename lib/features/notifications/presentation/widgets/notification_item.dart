import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/presentation/utils/enums/service_types_enum.dart';
import 'package:khalsha/features/notifications/data/models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(this.index, this.notification, {Key? key})
      : super(key: key);
  final NotificationModel notification;
  final int index;

  bool get isOdd => index.isOdd;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (notification.moduleKey == null) return;
        ServiceTypes? serviceType = ServiceTypes.values.firstWhereOrNull(
          (element) =>
              element.name.toUpperCase() ==
              notification.moduleKey!.toUpperCase(),
        );
        if (serviceType == null) return;

        Get.toNamed(
          Routes.orderDetails,
          arguments: {
            'orderId': notification.moduleId,
            'serviceType': serviceType,
            'isBill': false,
            'showOffers': true,
          },
        );
      },
      child: Container(
        constraints: const BoxConstraints(minHeight: 90),
        color: isOdd ? Colors.grey[200] : Colors.grey[100],
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Row(
          children: [
            Container(
              width: 2,
              height: 90,
              color: isOdd
                  ? ColorManager.darkTobyColor
                  : ColorManager.lightTobyColor,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                notification.text,
                style: Get.textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
