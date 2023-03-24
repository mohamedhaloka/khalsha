part of '../view.dart';

class _OrderDataTab extends GetView<OrderDetailsController> {
  const _OrderDataTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 30),
      children: [
        const OrderTabHeader(
          title: 'تفاصيل الطلب',
          hint: 'هنا تظهر جميع التفاصيل الخاصة بالعميل',
        ),
        _DetailsGroupItem(
          text: 'معلومات الطلب',
          details: controller.orderData,
        ),
        _DetailsGroupItem(
          text: 'مواصفات الطلب',
          details: controller.orderRequirement,
        ),
        _DetailsGroupItem(
          text: 'خدمات إضافية',
          details: controller.extraServices,
        ),
      ],
    );
  }
}

class _DetailsGroupItem extends StatelessWidget {
  const _DetailsGroupItem({
    Key? key,
    required this.details,
    required this.text,
  }) : super(key: key);
  final String text;
  final List<ItemModel> details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(40)),
              border: Border.all(color: ColorManager.lightGreyColor),
            ),
            child: Text(
              text,
              style: Get.textTheme.titleMedium!.copyWith(
                color: ColorManager.secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, int index) => SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    details[index].text,
                    textAlign: TextAlign.left,
                    style: Get.textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  const VerticalDivider(
                    color: ColorManager.lightGreyColor,
                    width: 50,
                  ),
                  Expanded(
                      child: Text(
                    details[index].description ?? '',
                    textAlign: TextAlign.right,
                  )),
                ],
              ),
            ),
            separatorBuilder: (_, __) => const Divider(
              color: ColorManager.lightGreyColor,
              height: 0,
            ),
            itemCount: details.length,
          )
        ],
      ),
    );
  }
}
