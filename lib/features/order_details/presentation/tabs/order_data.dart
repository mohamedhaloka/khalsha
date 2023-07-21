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
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, int index) => _DetailsGroupItem(
                  text: controller.orderModel.data[index].title,
                  details: controller.orderModel.data[index].data,
                  onTap: (action) async {
                    switch (action) {
                      case OrderDetailsAction.uploadFile:
                        final pickedImage = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (pickedImage == null) return;
                        controller.showFileChooseDialog(pickedImage.path);
                        break;
                      default:
                        break;
                    }
                  },
                ),
            itemCount: controller.orderModel.data.length),
      ],
    );
  }
}

class _DetailsGroupItem extends StatelessWidget {
  const _DetailsGroupItem({
    Key? key,
    required this.details,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final List<OrderDetailsItemModel> details;
  final void Function(OrderDetailsAction) onTap;

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
            itemBuilder: (_, int index) => InkWell(
              onTap: details[index].enableGesture
                  ? () => onTap(details[index].action)
                  : null,
              child: SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                      details[index].title ?? '',
                      textAlign: details[index].description != null
                          ? TextAlign.left
                          : TextAlign.center,
                      style: Get.textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                    if (details[index].description != null) ...[
                      const VerticalDivider(
                        color: ColorManager.lightGreyColor,
                        width: 50,
                      ),
                      Expanded(
                        child: details[index].type == OrderDetailsTypes.none
                            ? Text(
                                (details[index].description ?? '').tr,
                                textAlign: TextAlign.right,
                              )
                            : InkWell(
                                onTap: () {
                                  String url = HttpService.fileBaseURL +
                                      (details[index].description ?? '');
                                  launchUrl(
                                    Uri.parse(url),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                child: const Text(
                                  'أضغط هنا لتحميل الملف',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                      ),
                    ]
                  ],
                ),
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
