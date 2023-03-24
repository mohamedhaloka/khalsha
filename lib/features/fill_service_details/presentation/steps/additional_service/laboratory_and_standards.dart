part of 'additional_service_step_view.dart';

class _LaboratoryAndStandards extends GetView<AdditionalServiceStepController> {
  const _LaboratoryAndStandards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckerWithHolder(
          title: 'هل تحتاج المساعدة في تقديم الشهادات المطلوبة لهذه الشحنة',
          active: false.obs,
        ),
      ],
    );
  }
}
