part of '../view.dart';

class _BillDataTab extends GetView<OrderDetailsController> {
  const _BillDataTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = controller.orderModel;
    final invoice = controller.orderModel.invoice;
    final feedback = controller.orderModel.feedback;
    return ListView(
      padding: const EdgeInsets.only(top: 30),
      children: [
        const OrderTabHeader(
          title: 'الفاتورة',
          hint: 'هنا بتم تحديد فاتورتك و إرسالها للعميل',
        ),
        if (invoice != null) ...[
          if (feedback == null) ...[
            CustomRichText(
              text: 'يمكنك إضافة تقييمك   ',
              subText: 'من هنا',
              onTap: () => Get.bottomSheet(
                HeadLineBottomSheet(
                  bottomSheetTitle: 'أضف تقييم',
                  body: RateOrderSheet(invoice.user),
                  height: Get.height / 1.1,
                ),
                isScrollControlled: true,
              ),
            )
          ] else ...[
            _YourRate(feedback),
          ],
          Bill(
            items: invoice.items,
            total: invoice.total.toString(),
            orderId: invoice.id.toString(),
            userName: invoice.user!.name!,
            billCreatedDate: invoice.createdAt.toString(),
            userBio: invoice.user!.bio!,
          ),

          // if (orderData.invoiceUrl != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: CustomButton(
              onTap: () {
                log(
                  orderData.invoiceUrl.toString(),
                  name: 'Invoice Url',
                );
              },
              text: 'مشاركة',
            ),
          ),
        ],
      ],
    );
  }
}

class _YourRate extends StatelessWidget {
  const _YourRate(this.feedback, {Key? key}) : super(key: key);
  final FeedbackObj? feedback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        const TextUnderline('تقييمك'),
        Row(
          children: [
            Expanded(child: Text(feedback?.feedback ?? '')),
            RatingBar.builder(
              initialRating: feedback?.rate?.toDouble() ?? 0.0,
              minRating: 1,
              glow: false,
              itemSize: 20,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: ColorManager.primaryColor,
              ),
              onRatingUpdate: (_) => _,
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
