part of '../view.dart';

class _StatusData extends GetView<OrderDetailsController> {
  const _StatusData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 30),
      children: [
        const OrderTabHeader(
          title: 'حالة طلبك الأن',
          hint: 'هنا تظهر حالة الطلب من قبلك',
        ),
        SizedBox(
          height: 200,
          child: Obx(() => Row(
                children: [
                  if (controller.currentStatus.value != 0) ...[
                    InkWell(
                      onTap: () {
                        controller.currentStatus.value--;
                        controller.goToStatus();
                      },
                      child: RotatedBox(
                          quarterTurns: 2,
                          child: SvgPicture.asset(
                              'assets/images/icons/arrow.svg')),
                    ),
                  ] else ...[
                    const SizedBox(width: 30),
                  ],
                  Expanded(
                    child: PageView.builder(
                      controller: controller.statusSliderController,
                      onPageChanged: (int index) =>
                          controller.currentStatus(index),
                      itemCount: controller.status.length,
                      itemBuilder: (_, int index) =>
                          _StatusItem(controller.status[index]),
                    ),
                  ),
                  if (controller.currentStatus.value !=
                      controller.status.length - 1) ...[
                    InkWell(
                      onTap: () {
                        controller.currentStatus.value++;
                        controller.goToStatus();
                      },
                      child: SvgPicture.asset('assets/images/icons/arrow.svg'),
                    ),
                  ] else ...[
                    const SizedBox(width: 30),
                  ],
                ],
              )),
        ),
        Obx(() => Column(
              children: [
                Text(status),
                TextUnderline(
                  statusTxt,
                  contentColor: _statusColor,
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: CustomButton(
            onTap: () {},
            text: 'تعديل حالة الطلب',
          ),
        )
      ],
    );
  }

  String get statusTxt =>
      controller.status[controller.currentStatus.value].text;

  String get status {
    ItemModel status = controller.status[controller.currentStatus.value];
    switch (status.statusId) {
      case 0:
        return 'الحالة المنتهية';
      case 1:
        return 'الحالة الحالية';
      case 2:
        return 'حالة لم تنتهي';
      default:
        return '';
    }
  }

  Color get _statusColor {
    ItemModel status = controller.status[controller.currentStatus.value];
    switch (status.statusId) {
      case 0:
        return ColorManager.primaryColor;
      case 1:
        return ColorManager.secondaryColor;
      case 2:
        return ColorManager.lightGreyColor;
      default:
        return Colors.black;
    }
  }
}

class _StatusItem extends StatelessWidget {
  const _StatusItem(
    this.status, {
    Key? key,
  }) : super(key: key);
  final ItemModel status;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: _statusColor,
          child: SvgPicture.asset(
              'assets/images/order_details/status/${status.image}.svg'),
        ),
        const SizedBox(height: 5),
        Text(
          status.text,
          style: Get.textTheme.headlineSmall,
        )
      ],
    );
  }

  Color get _statusColor {
    switch (status.statusId) {
      case 0:
        return ColorManager.primaryColor;
      case 1:
        return ColorManager.secondaryColor;
      case 2:
        return ColorManager.lightGreyColor;
      default:
        return Colors.black;
    }
  }
}
