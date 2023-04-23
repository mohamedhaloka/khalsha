part of '../laboratory.dart';

class AddEditLaboratoryAndStandardsServiceView
    extends GetView<AddEditLaboratoryAndStandardsServiceController> {
  const AddEditLaboratoryAndStandardsServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKey,
      child: ServiceContent(
        onTapBack: controller.onTapBack,
        onPageChanged: controller.onPageChanged,
        pageViewController: controller.pageController,
        pageTitle: controller.pageTitle,
        onTapNext: controller.onTapNext,
        currentStep: controller.currentStep,
        btnLoading: controller.loading,
        children: controller.children,
      ),
    );
  }
}

class _FillData
    extends GetView<AddEditLaboratoryAndStandardsServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceTypes.laboratoryAndStandards.value,
      body: Column(
        children: [
          FormBuilderField(
            initialValue: controller.name.text,
            builder: (FormFieldState<dynamic> field) =>
                TextFieldInputWithHolder(
              title: 'عنوان الطلب',
              hint: 'أضف عنوان',
              controller: controller.name,
              onSaved: (String? value) => field.didChange(value),
              errorText: field.errorText,
            ),
            validator: FormBuilderValidators.required(),
            name: 'name',
          ),
          FormBuilderField(
            initialValue: controller.factoryAduitReport,
            builder: (FormFieldState<dynamic> field) => AttachFileWithHolder(
              title: 'متوفر لدي المورد Factory aduit report',
              file: controller.factoryAduitReport,
              onChooseFile: (String path) => field.didChange(path),
              errorMsg: field.errorText,
            ),
            validator: FormBuilderValidators.required(),
            name: 'factory_report',
          ),
          FormBuilderField(
            initialValue: controller.testReportPhoto,
            builder: (FormFieldState<dynamic> field) => AttachFileWithHolder(
              title: 'متوفر لدي المورد Test report',
              file: controller.testReportPhoto,
              onChooseFile: (String path) => field.didChange(path),
              errorMsg: field.errorText,
            ),
            validator: FormBuilderValidators.required(),
            name: 'test_report',
          ),
          FormBuilderField(
            initialValue: controller.isAdd ? null : 'x',
            builder: (FormFieldState<dynamic> field) => Obx(
              () => ServiceItemWithHolder(
                title: 'أصناف الطلب',
                height: Get.height / 1.2,
                text: controller.orderItems.isNotEmpty ? 'تم' : null,
                body: const OrderItemsSheet(),
                onBack: (bool hasEmptyData) => field.didChange(
                  hasEmptyData ? '' : 'x',
                ),
                errorMsg: field.errorText,
              ),
            ),
            validator: FormBuilderValidators.required(),
            name: 'order_items',
          ),
          TextFieldInputWithHolder(
            hint: 'ملاحظات',
            controller: controller.notes,
          ),
        ],
      ),
    );
  }
}

class _AdditionalServices
    extends GetView<AddEditLaboratoryAndStandardsServiceController> {
  const _AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Column(
        children: [
          CheckerWithHolder(
            title: 'خدمة إستخراج الشهادات اللازمة',
            active: controller.certificates
                .any((element) => element.selected.value)
                .obs,
            bottomSheetTitle: 'الشهادات',
            body: ChooseCertificates(controller.certificates),
            height: Get.height / 1.6,
          ),
        ],
      ),
    );
  }
}
