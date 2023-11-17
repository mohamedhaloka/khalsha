import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/notifications/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/notifications/presentation/widgets/notification_item.dart';
import 'package:khalsha/features/widgets/custom_app_bar.dart';
import 'package:khalsha/features/widgets/smart_refresh.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'أحدث الإشعارات'),
      body: NotificationsBody(),
    );
  }
}

class NotificationsBody extends StatefulWidget {
  const NotificationsBody({super.key});

  @override
  State<NotificationsBody> createState() => _NotificationsBodyState();
}

class _NotificationsBodyState extends State<NotificationsBody> {
  final NotificationsController controller =
      Get.find<NotificationsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loading.value
        ? const Center(child: CircularProgressIndicator())
        : SmartRefresh(
            controller: controller.refreshController,
            footer: true,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemBuilder: (_, int index) => NotificationItem(
                index,
                controller.notifications[index],
              ),
              itemCount: controller.notifications.length,
            ),
          ));
  }
}
