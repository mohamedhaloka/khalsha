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
          icon: 'laboratory_icon',
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
            builder: (FormFieldState<dynamic> field) =>
                TextFieldInputWithHolder(
              title: 'عنوان الطلب',
              hint: 'مثال: فحص مواد أولية',
              controller: controller.name,
              onSaved: (String? value) => field.didChange(value),
              errorText: field.errorText,
            ),
            validator: FormBuilderValidators.required(),
            name: LaboratoryInputsKeys.title.name,
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
          AttachFileWithHolder(
            title: 'متوفر لدي المورد Factory aduit report',
            file: controller.factoryAduitReport,
          ),
          AttachFileWithHolder(
            title: 'متوفر لدي المورد Test report',
            file: controller.testReportPhoto,
          ),
          TextFieldInputWithHolder(
            hint: 'ملاحظات',
            maxLines: 4,
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
            title: 'خدمة إستخراج الشهادات المطلوبة',
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
  orderItems,
}
