part of 'additional_service_step_view.dart';

class _AirFreight extends GetView<AdditionalServiceStepController> {
  const _AirFreight({Key? key}) : super(key: key);

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
        InkWell(
          onTap: () {
            Get.bottomSheet(
              HeadLineBottomSheet(
                height: Get.height / 2,
                body: const AddNotesSheet(
                  text: 'اذكر الملاحظات التي تود كتابتها',
                ),
                bottomSheetTitle: 'ملاحظاتي',
              ),
              isScrollControlled: true,
            );
          },
          child: Text(
            'اضافة ملاحظات',
            style: Get.textTheme.bodyMedium!.copyWith(
              color: ColorManager.secondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
