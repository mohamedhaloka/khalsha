part of '../view.dart';

class _BillDataTab extends GetView<OrderDetailsController> {
  const _BillDataTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 30),
      children: [
        const OrderTabHeader(
          title: 'الفاتورة',
          hint: 'هنا بتم تحديد فاتورتك و إرسالها للعميل',
        ),
        const Bill(),
        CustomButton(
          onTap: () {},
          text: 'إضافة بنود أخرى',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: CustomButton(
            onTap: () {},
            text: 'مشاركة',
          ),
        ),
      ],
    );
  }
}
