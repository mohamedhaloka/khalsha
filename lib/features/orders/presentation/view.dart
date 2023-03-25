import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/orders/presentation/widgets/filter.dart';
import 'package:khalsha/features/orders/presentation/widgets/order_item.dart';
import 'package:khalsha/features/widgets/custom_app_bar.dart';

import 'get/controllers/controller.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'عروض الشحن البري',
      ),
      body: OrdersBody(),
    );
  }
}

class OrdersBody extends StatefulWidget {
  const OrdersBody({Key? key}) : super(key: key);

  @override
  State<OrdersBody> createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {
  late OrdersController controller = Get.find<OrdersController>();

  @override
  void initState() {
    if (!Get.isRegistered<OrdersController>()) {
      Get.lazyPut<OrdersController>(() => OrdersController());
      controller = Get.find<OrdersController>();
    }
    super.initState();
  }

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
