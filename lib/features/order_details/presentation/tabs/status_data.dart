part of '../view.dart';

const kDone = 'done';
const kPending = 'pending';
const kClosed = 'closed';

class _StatusData extends StatefulWidget {
  const _StatusData({Key? key}) : super(key: key);

  @override
  State<_StatusData> createState() => _StatusDataState();
}

class _StatusDataState extends State<_StatusData> {
  final controller = Get.find<OrderDetailsController>();
  RxInt currentStatus = 0.obs;

  PageController statusSliderController = PageController();

  @override
  void initState() {
    if (controller.orderModel is! CustomsClearanceOrder) return;
    List<OrderStepModel> steps =
        (controller.orderModel as CustomsClearanceOrder).steps;
    int initialPage = steps.indexWhere((element) => element.status == kPending);
    if (initialPage == -1) {
      currentStatus(steps.length - 1);
      statusSliderController = PageController(initialPage: steps.length - 1);
      return;
    }
    currentStatus(initialPage);
    statusSliderController = PageController(initialPage: initialPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = controller.orderModel as CustomsClearanceOrder;
    return RefreshIndicator(
      onRefresh: controller.getOrderDetails,
      child: ListView(
        padding: const EdgeInsets.only(top: 30),
        children: [
          const OrderTabHeader(
            title: 'حالة طلبك الأن',
            hint: 'هنا تظهر حالة الطلب من قبلك',
          ),
          if (orderData.steps.isNotEmpty) ...[
            if (orderData.steps
                .any((element) => element.step == 'create_invoice')) ...[
              const Card(
                margin: EdgeInsets.symmetric(vertical: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  side: BorderSide(color: ColorManager.primaryColor),
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    'عزيزي العميل، نود إعلامك بأن خدمتك قد انتهت بنجاح و سوف يتم إصدار فاتورة لتسديد المبلغ المستحق لمزود الخدمة و ستتضمن الفاتورة تفاصيل الخدمات التي تم تقديمها لك، بالإضافة إلى المبلغ المستحق وموعد استحقاق الدفع.  يرجى التواصل مع مزود الخدمة لمتابعة السداد ونشكرك على اختيارك لخدمتنا، ونتطلع إلى خدمتك مجددًا في المستقبل.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: statusSliderController,
                onPageChanged: (int index) => currentStatus(index),
                itemCount: orderData.steps.length,
                itemBuilder: (_, int index) =>
                    _StatusItem(orderData.steps[index]),
              ),
            ),
            Obx(
              () => Column(
                children: [
                  Text(status(orderData.steps)),
                  TextUnderline(
                    statusTxt(orderData.steps).tr,
                    contentColor: _statusColor(orderData.steps),
                  ),
                ],
              ),
            ),
            OrderStatusSteps(
              steps: orderData.steps,
            ),
          ]
        ],
      ),
    );
  }

  String statusTxt(List<OrderStepModel> steps) =>
      steps[currentStatus.value].step!;

  String status(List<OrderStepModel> steps) {
    String statusStr = steps[currentStatus.value].status!;
    switch (statusStr) {
      case kDone:
        return 'الحالة المنتهية';
      case kPending:
        return 'الحالة الحالية';
      default:
        return 'حالة لم تنتهي';
    }
  }

  Color _statusColor(List<OrderStepModel> steps) {
    String statusStr = steps[currentStatus.value].status!;
    switch (statusStr) {
      case kDone:
        return ColorManager.secondaryColor;
      case kPending:
        return ColorManager.primaryColor;
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
          status.step!.tr,
          style: Get.textTheme.headlineSmall,
        )
      ],
    );
  }

  Color get _statusColor {
    switch (status.status) {
      case kDone:
        return ColorManager.secondaryColor;
      case kPending:
        return ColorManager.primaryColor;
      default:
        return ColorManager.lightGreyColor;
    }
  }
}
