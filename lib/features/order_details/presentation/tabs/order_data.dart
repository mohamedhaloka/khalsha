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
                        final pickedImage = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 30,
                          maxWidth: 350,
                          maxHeight: 350,
                        );
                        if (pickedImage == null) return;

                        final int imageSize = await pickedImage.length();
                        // print('imageSize : $imageSize');
                        if (imageSize > 4000000) {
                          showAlertMessage('file-must-be-smaller-than-4mb');
                          return;
                        }

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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
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
                      Container(
                        width: 2,
                        height: 14,
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          color: ColorManager.lightGreyColor,
                        ),
                      ),
                      Expanded(
                        child: details[index].type == OrderDetailsTypes.none
                            ? Text(
                                (details[index].description ?? '').tr,
                                textAlign: TextAlign.right,
                              )
                            : InkWell(
                                onTap: () {
                                  String? url;

                                  switch (details[index].type) {
                                    case OrderDetailsTypes.file:
                                      url = HttpService.fileBaseURL +
                                          (details[index].description ?? '');
                                      break;
                                    case OrderDetailsTypes.mapDirection:
                                      url =
                                          'https://www.google.com/maps/search/?api=1&query=${details[index].value}';
                                      break;
                                    default:
                                      break;
                                  }

                                  if (url == null) return;
                                  launchUrl(
                                    Uri.parse(url),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                child: Text(
                                  details[index].type == OrderDetailsTypes.file
                                      ? 'أضغط هنا لتحميل الملف'
                                      : (details[index].description ?? '').tr,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
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
