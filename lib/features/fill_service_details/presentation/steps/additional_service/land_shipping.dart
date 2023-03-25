part of 'additional_service_step_view.dart';

class _LandShipping extends GetView<AdditionalServiceStepController> {
  const _LandShipping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ServiceItemWithHolder(
          title: 'خدمة الفك و التركيب',
          bottomSheetTitle: 'خدمة التخزين',
          height: Get.height / 1.5,
          body: const StorageService(),
        ),
        ServiceItemWithHolder(
          title: 'درجة حرارة الشحنة',
          bottomSheetTitle: 'درجة الحرارة',
          height: Get.height / 2,
          body: const OrderTemperature(),
        ),
        ServiceItemWithHolder(
          title: 'هل تحتاج عمال تحميل',
          bottomSheetTitle: 'عمال تحميل',
          height: Get.height / 3,
          body: SetNumberCount(
            number: controller.numberOfStorage,
            title: 'عدد العمال',
          ),
        ),
        ServiceItemWithHolder(
          title: 'هل تحتاج عمال تنزيل',
          bottomSheetTitle: 'عمال تنزيل',
          height: Get.height / 3,
          body: SetNumberCount(
            number: controller.numberOfStorage,
            title: 'عدد العمال',
          ),
        ),
        ServiceItemWithHolder(
          title: 'هل تريد التخزين',
          bottomSheetTitle: 'خدمة التخزين',
          height: Get.height / 3,
          body: SetNumberCount(
            number: controller.numberOfStorage,
            title: 'عدد أيام التخزين',
          ),
        ),
        YesOrNoWithHolder(
          active: true.obs,
          title: 'هل توجد مواد قابلة للإشتعال',
        ),
      ],
    );
  }
}
