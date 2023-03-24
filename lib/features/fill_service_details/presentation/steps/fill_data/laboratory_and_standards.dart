part of 'fill_data_step_view.dart';

class _LaboratoryAndStandards extends GetView<FillDataController> {
  const _LaboratoryAndStandards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ServiceItemWithHolder(
          title: 'متوفر لدي المورد Factory aduit report',
          bottomSheetTitle: 'خدمة التخزين',
          height: Get.height / 3,
          onTap: () {},
          body: const Text('lll'),
        ),
        ServiceItemWithHolder(
          title: 'متوفر لدي المورد Test report',
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
