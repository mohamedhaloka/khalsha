part of '../view.dart';

class _BillDataTab extends GetView<OrderDetailsController> {
  const _BillDataTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final invoice = controller.orderModel.invoice;
    return ListView(
      padding: const EdgeInsets.only(top: 30),
      children: [
        const OrderTabHeader(
          title: 'الفاتورة',
          hint: 'هنا بتم تحديد فاتورتك و إرسالها للعميل',
        ),
        if (invoice != null) ...[
          Bill(
            items: invoice.items,
            total: invoice.total.toString(),
            orderId: invoice.id.toString(),
            userName: invoice.user!.name!,
            billCreatedDate: invoice.importListDate!,
            userBio: invoice.user!.bio!,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: CustomButton(
              onTap: () {},
              text: 'مشاركة',
            ),
          ),
        ],
      ],
    );
  }
}
