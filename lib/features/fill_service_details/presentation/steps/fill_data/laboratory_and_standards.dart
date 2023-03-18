part of 'fill_data_step_view.dart';

class _LaboratoryAndStandards extends GetView<FillDataController> {
  const _LaboratoryAndStandards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdditionalServiceItemWithHolder(
          title: 'متوفر لدي المورد Factory aduit report',
          item: 0.obs,
          bottomSheetTitle: 'خدمة التخزين',
          height: Get.height / 3,
          onTap: () {},
          body: const Text('lll'),
        ),
        AdditionalServiceItemWithHolder(
          title: 'متوفر لدي المورد Test report',
          item: 0.obs,
          bottomSheetTitle: 'خدمة التخزين',
          height: Get.height / 3,
          onTap: () {},
          body: const Text('lll'),
        ),
        const TextFieldInputWithHolder(
          hint: 'ملاحظات',
        ),
      ],
    );
  }
}
