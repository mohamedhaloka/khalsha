part of 'additional_service_step_view.dart';

class _CustomsClearance extends GetView<AdditionalServiceStepController> {
  const _CustomsClearance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        AdditionalServiceItemWithHolder(
          title: 'هل يوجد بند جمركي',
          item: controller.customsClauseList.length.obs,
          bottomSheetTitle: 'إضافة بند جمركي',
          height: Get.height / 2,
          body: CustomsClause(
            customsClause: controller.customsClauseList,
            onAdd: controller.addNewClause,
          ),
        ),
      ],
    );
  }
}
