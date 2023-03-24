part of 'additional_service_step_view.dart';

class _MarineShipping extends GetView<AdditionalServiceStepController> {
  const _MarineShipping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckerWithHolder(
          title: 'خدمة التأمين',
          active: true.obs,
        ),
        CheckerWithHolder(
          title: 'خدمة التخليص الجمركي',
          active: true.obs,
        ),
        CheckerWithHolder(
          title: 'المساعدة في إستخراج الشهادات',
          active: false.obs,
          bottomSheetTitle: 'الشهادات',
          body: const ChooseCertificates(),
          height: Get.height / 1.6,
        ),
      ],
    );
  }
}
