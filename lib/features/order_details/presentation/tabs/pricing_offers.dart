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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: TableItems(
            onItemTapped: () {},
            itemsHeader: const ['المستخدم', 'إجمالي الفاتورة', 'الحالة', ''],
            onBackTapped: () {},
            onNextTapped: () {},
          ),
        ),
      ],
    );
  }
}
