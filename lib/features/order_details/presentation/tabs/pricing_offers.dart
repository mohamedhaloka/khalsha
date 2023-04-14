part of '../view.dart';

class _PricingOffersTab extends GetView<OrderDetailsController> {
  const _PricingOffersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 30),
      children: [
        const OrderTabHeader(
          title: 'عروض الأسعار',
          hint: 'هنا تظهر جميع عروض الأسعار المقدمة لك',
        ),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 15),
          itemBuilder: (_, int index) => Row(
            children: [
              Expanded(
                  child: Text(controller.orderModel.offers[index].user.name)),
              Expanded(child: Text(controller.orderModel.offers[index].total)),
              Text(
                'عرض',
                style: Get.textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: ColorManager.secondaryColor,
                ),
              )
            ],
          ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: controller.orderModel.offers.length,
        ),
      ],
    );
  }
}
