import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/orders/presentation/widgets/filter.dart';
import 'package:khalsha/features/orders/presentation/widgets/order_item.dart';

import 'get/controllers/controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Filter(),
        ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, int index) => OrderItem(controller.orders[index]),
            separatorBuilder: (_, __) => const SizedBox(height: 20),
            itemCount: controller.orders.length),
      ],
    );
  }
}
