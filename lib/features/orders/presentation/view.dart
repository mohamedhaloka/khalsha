import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/source/local/intro_hint_count_locale.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/presentation/utils/enums/service_types_enum.dart';
import 'package:khalsha/features/orders/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/orders/presentation/widgets/filter.dart';
import 'package:khalsha/features/orders/presentation/widgets/order_item.dart';
import 'package:khalsha/features/widgets/custom_app_bar.dart';
import 'package:khalsha/features/widgets/headline_bottom_sheet.dart';
import 'package:khalsha/features/widgets/services_filtration_sheet.dart';
import 'package:khalsha/features/widgets/smart_refresh.dart';
import 'package:khalsha/injection_container.dart';

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
  OrdersController controller = Get.find<OrdersController>();

  Intro intro = Intro(
    noAnimation: false,
    stepCount: 1,
    borderRadius: const BorderRadius.all(Radius.circular(4)),
    widgetBuilder: StepWidgetBuilder.useDefaultTheme(
      texts: [
        'يمكنك استعراض طلباتك من خلال الضغط هنا.',
      ],
      buttonTextBuilder: (curr, total) => 'حسناً',
    ),
  );

  Timer? timer;
  @override
  void initState() {
    if (!Get.isRegistered<OrdersController>()) {
      Get.lazyPut<OrdersController>(() => OrdersController(
            InjectionContainer.sl(),
          ));
      controller = Get.find<OrdersController>();
    }
    final int introShowCount = IntroHintCountLocal.instance.get();
    if (introShowCount > 3) return;
    timer = Timer(
      const Duration(seconds: 1),
      () {
        intro.start(context);
        IntroHintCountLocal.instance.save(introShowCount + 1);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresh(
      controller: controller.refreshController,
      onRefresh: controller.onRefresh,
      onLoading: controller.onLoading,
      footer: true,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Obx(() => Filter(
                key: intro.keys[0],
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
          Obx(
            () => controller.loading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.secondaryColor,
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, int index) => OrderItem(
                      controller.orders[index],
                      route: controller.route,
                      serviceType:
                          ServiceTypes.values[controller.selectedService.value],
                    ),
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                    itemCount: controller.orders.length,
                  ),
          ),
        ],
      ),
    );
  }
}
