part of 'additional_service_step_view.dart';

class _LandShipping extends GetView<AdditionalServiceStepController> {
  const _LandShipping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdditionalServiceItemWithHolder(
          title: 'خدمة الفك و التركيب',
          item: controller.numberOfStorage,
          bottomSheetTitle: 'خدمة التخزين',
          height: Get.height / 3,
          body: SetNumberCount(
            number: controller.numberOfStorage,
            title: 'عدد أيام التخزين',
          ),
        ),
        AdditionalServiceItemWithHolder(
          title: 'درجة حرارة الشحنة',
          item: controller.numberOfStorage,
          bottomSheetTitle: 'درجة الحرارة',
          height: Get.height / 3,
          body: SetNumberCount(
            number: controller.numberOfStorage,
            title: 'عدد أيام التخزين',
          ),
        ),
        AdditionalServiceItemWithHolder(
          title: 'هل تحتاج عمال تحميل',
          item: controller.numberOfStorage,
          bottomSheetTitle: 'عمال تحميل',
          height: Get.height / 3,
          body: SetNumberCount(
            number: controller.numberOfStorage,
            title: 'عدد العمال',
          ),
        ),
        AdditionalServiceItemWithHolder(
          title: 'هل تحتاج عمال تنزيل',
          item: controller.numberOfStorage,
          bottomSheetTitle: 'عمال تنزيل',
          height: Get.height / 3,
          body: SetNumberCount(
            number: controller.numberOfStorage,
            title: 'عدد العمال',
          ),
        ),
        AdditionalServiceItemWithHolder(
          title: 'هل تريد التخزين',
          item: controller.numberOfStorage,
          bottomSheetTitle: 'خدمة التخزين',
          height: Get.height / 3,
          body: SetNumberCount(
            number: controller.numberOfStorage,
            title: 'عدد أيام التخزين',
          ),
        ),
      ],
    );
  }
}
