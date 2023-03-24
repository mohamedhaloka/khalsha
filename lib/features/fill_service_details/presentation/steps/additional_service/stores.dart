part of 'additional_service_step_view.dart';

class _Stores extends GetView<AdditionalServiceStepController> {
  const _Stores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckerWithHolder(
          title: 'هل تريد خدمة التغليف',
          active: false.obs,
        ),
        CheckerWithHolder(
          title: 'المساعدة بتسجيل المنتجات بالهيئة',
          active: false.obs,
        ),
        CheckerWithHolder(
          title: 'المساعة في إستخراج تراخيص الشركات و المؤسسات للاستيراد',
          active: true.obs,
        ),
        CheckerWithHolder(
          title: 'المساعة في إجراءات وزارة الزراعة',
          active: false.obs,
        ),
      ],
    );
  }
}
