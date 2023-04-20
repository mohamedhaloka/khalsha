part of '../laboratory.dart';

class AddEditLaboratoryAndStandardsServiceView
    extends GetView<AddEditLaboratoryAndStandardsServiceController> {
  const AddEditLaboratoryAndStandardsServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ServiceContent(
      onTapBack: controller.onTapBack,
      onPageChanged: controller.onPageChanged,
      pageViewController: controller.pageController,
      pageTitle: controller.pageTitle,
      onTapNext: controller.onTapNext,
      currentStep: controller.currentStep,
      btnLoading: controller.loading,
      children: controller.children,
    );
  }
}

class _FillData
    extends GetView<AddEditLaboratoryAndStandardsServiceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceType.laboratoryAndStandards.value,
      body: Column(
        children: [
          TextFieldInputWithHolder(
            title: 'عنوان الطلب',
            hint: 'أضف عنوان',
            controller: controller.name,
          ),
          AttachFileWithHolder(
            title: 'متوفر لدي المورد Factory aduit report',
            file: controller.factoryAduitReport,
          ),
          AttachFileWithHolder(
            title: 'متوفر لدي المورد Test report',
            file: controller.testReportPhoto,
          ),
          Obx(() => ServiceItemWithHolder(
                title: 'أصناف الطلب',
                height: Get.height / 1.2,
                text: controller.orderItems.isNotEmpty ? 'تم' : null,
                body: const OrderItemsSheet(),
              )),
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
