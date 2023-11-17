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
          itemBuilder: (_, int index) => _OfferItem(
            controller.orderModel.offers[index],
          ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: controller.orderModel.offers.length,
        ),
      ],
    );
  }
}

class _OfferItem extends StatelessWidget {
  const _OfferItem(
    this.offer, {
    Key? key,
  }) : super(key: key);
  final OfferModel offer;

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: offer.rejectedAt != null
          ? const BoxDecoration(
              color: Colors.grey,
              backgroundBlendMode: BlendMode.saturation,
            )
          : null,
      child: InkWell(
        onTap: offer.rejectedAt != null
            ? () => util.showAlertMessage('تم رفض الطلب')
            : () => Get.bottomSheet(
                  HeadLineBottomSheet(
                    bottomSheetTitle: '${'offer'.tr} ${offer.id}',
                    body: PricingOfferDetailsSheet(
                      offer,
                    ),
                    height: Get.height / 1.1,
                  ),
                  isScrollControlled: true,
                ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(6)),
              border: Border.all(color: Get.theme.primaryColor)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offer.user!.name!,
                style: Get.textTheme.titleMedium!.copyWith(
                  color: ColorManager.primaryColor,
                ),
              ),
              Text('${offer.total} ${'riyal_saudi'.tr}'),
            ],
          ),
        ),
      ),
    );
  }
}
