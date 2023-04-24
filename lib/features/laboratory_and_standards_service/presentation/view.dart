part of '../laboratory.dart';

class AddEditLaboratoryAndStandardsServiceView
    extends GetView<AddEditLaboratoryAndStandardsServiceController> {
  const AddEditLaboratoryAndStandardsServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKey,
      child: Obx(
        () => ServiceContent(
          onTapBack: controller.onTapBack,
          onPageChanged: controller.onPageChanged,
          pageViewController: controller.pageController,
          pageTitle: controller.pageTitle,
          onTapNext: controller.onTapNext,
          currentStep: controller.currentStep,
          btnLoading: controller.loading,
          nextTitle: controller.nextTitle,
          children: controller.children,
        ),
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
            name: LaboratoryInputsKeys.title.name,
          ),
          FormBuilderField<String>(
            initialValue: controller.factoryAduitReport.value.path,
            builder: (FormFieldState<String> field) => AttachFileWithHolder(
              title: 'متوفر لدي المورد Factory aduit report',
              file: controller.factoryAduitReport,
              onChooseFile: (String path) => field.didChange(path),
              errorMsg: field.errorText,
            ),
            validator: FormBuilderValidators.required(),
            name: LaboratoryInputsKeys.factoryAdultReport.name,
            onSaved: (_) {
              final value = controller.factoryAduitReport.value.path;
              controller.didFieldChanged(
                LaboratoryInputsKeys.factoryAdultReport.name,
                value: value,
              );
            },
          ),
          FormBuilderField(
            builder: (FormFieldState<dynamic> field) => AttachFileWithHolder(
              title: 'متوفر لدي المورد Test report',
              file: controller.testReportPhoto,
              onChooseFile: (String path) => field.didChange(path),
              errorMsg: field.errorText,
            ),
            validator: FormBuilderValidators.required(),
            name: LaboratoryInputsKeys.testReport.name,
            onSaved: (_) {
              final value = controller.testReportPhoto.value.path;
              controller.didFieldChanged(
                LaboratoryInputsKeys.testReport.name,
                value: value,
              );
            },
          ),
          FormBuilderField(
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
            name: LaboratoryInputsKeys.orderItems.name,
            onSaved: (_) {
              final hasEmptyInputs = controller.orderItems.any(
                (element) =>
                    element.photoItem.value.path.isEmpty ||
                    element.photoCard.value.path.isEmpty ||
                    element.itemServiceId.value.isEmpty ||
                    element.factoryName.text.isEmpty ||
                    element.nameAr.text.isEmpty ||
                    element.nameEn.text.isEmpty ||
                    element.customsCode.text.isEmpty,
              );
              controller.didFieldChanged(
                LaboratoryInputsKeys.orderItems.name,
                value: hasEmptyInputs ? '' : 'x',
              );
            },
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

enum LaboratoryInputsKeys {
  title,
  factoryAdultReport,
  testReport,
  orderItems,
}
