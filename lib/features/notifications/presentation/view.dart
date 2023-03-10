import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/notifications/presentation/widgets/notification_item.dart';

import 'get/controllers/controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemBuilder: (_, int index) => NotificationItem(
        index,
        controller.notifications[index],
      ),
      itemCount: controller.notifications.length,
    );
  }
}
