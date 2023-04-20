part of '../view.dart';

const kDone = 'done';
const kPending = 'pending';

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
        if (controller.orderModel.steps.isNotEmpty) ...[
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
                        itemCount: controller.orderModel.steps.length,
                        itemBuilder: (_, int index) =>
                            _StatusItem(controller.orderModel.steps[index]),
                      ),
                    ),
                    if (controller.currentStatus.value !=
                        controller.orderModel.steps.length - 1) ...[
                      InkWell(
                        onTap: () {
                          controller.currentStatus.value++;
                          controller.goToStatus();
                        },
                        child:
                            SvgPicture.asset('assets/images/icons/arrow.svg'),
                      ),
                    ] else ...[
                      const SizedBox(width: 30),
                    ],
                  ],
                )),
          ),
          Obx(
            () => Column(
              children: [
                Text(status),
                TextUnderline(
                  statusTxt.tr,
                  contentColor: _statusColor,
                ),
              ],
            ),
          ),
          OrderStatusSteps(
            steps: controller.orderModel.steps,
          ),
        ]
      ],
    );
  }

  String get statusTxt =>
      controller.orderModel.steps[controller.currentStatus.value].step;

  String get status {
    String statusStr =
        controller.orderModel.steps[controller.currentStatus.value].status;
    switch (statusStr) {
      case kDone:
        return 'الحالة المنتهية';
      case kPending:
        return 'الحالة الحالية';
      default:
        return 'حالة لم تنتهي';
    }
  }

  Color get _statusColor {
    String statusStr =
        controller.orderModel.steps[controller.currentStatus.value].status;
    switch (statusStr) {
      case kDone:
        return ColorManager.primaryColor;
      case kPending:
        return ColorManager.secondaryColor;
      default:
        return ColorManager.lightGreyColor;
    }
  }
}

class _StatusItem extends StatelessWidget {
  const _StatusItem(
    this.status, {
    Key? key,
  }) : super(key: key);
  final OrderStepModel status;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: _statusColor,
          child: Text(
            (status.status == kDone ? 'y' : 'x').toUpperCase(),
            style: Get.textTheme.titleLarge!.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          status.step.tr,
          style: Get.textTheme.headlineSmall,
        )
      ],
    );
  }

  Color get _statusColor {
    switch (status.status) {
      case kDone:
        return ColorManager.primaryColor;
      case kPending:
        return ColorManager.secondaryColor;
      default:
        return ColorManager.lightGreyColor;
    }
  }
}
