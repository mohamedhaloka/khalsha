part of '../customs_clearance.dart';

class AddEditCustomsClearanceServiceView
    extends GetView<AddEditCustomsClearanceController> {
  const AddEditCustomsClearanceServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ServiceContent(
        onTapBack: controller.onTapBack,
        onPageChanged: controller.onPageChanged,
        pageViewController: controller.pageController,
        pageTitle: controller.pageTitle,
        onTapNext: controller.onTapNext,
        nextTitle: controller.nextTitle,
        currentStep: controller.currentStep,
        btnLoading: controller.loading,
        icon: 'customs_clearance_icon',
        children: controller.children,
      ),
    );
  }
}

class _FillData extends GetView<AddEditCustomsClearanceController> {
  const _FillData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FillDataStepView(
      serviceName: ServiceTypes.laboratoryAndStandards.value,
      image: 'customs',
      body: Column(
        children: [
          TextFieldInputWithHolder(
            title: 'عنوان الطلب',
            hint: 'مثال: تخليص مواد كهربائية',
            controller: controller.name,
          ),
          ToggleItemWithHolder(
            title: 'مجال الشحنة',
            items: shippingFieldOptions,
            selectedItem: controller.selectedShippingField,
          ),
          ToggleItemWithHolder(
            title: 'نوع المعاملة',
            items: shippingTypeOptions,
            selectedItem: controller.selectedShippingType,
            toolTipMsg: '''''',
          ),
          ChooseItemWithHolder(
            title: 'منفذ الشحنة',
            selectedItem: controller.selectedShippingPort,
            bottomSheetTitle: 'اختر منفذ الشحنة',
            height: Get.height / 2,
            body: MultiItemsList(
              items: controller.shippingPorts,
              selectedItem: controller.selectedShippingPort,
            ),
          ),
          TextFieldInputWithHolder(
            title: 'التوصيل إلي',
            controller: controller.deliverTo,
            enabled: false,
            onTap: controller.chooseLocation,
          ),
        ],
      ),
    );
  }
}

class _OrderDetails extends GetView<AddEditCustomsClearanceController> {
  const _OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      imagePath: 'assets/images/intro_services/customs.svg',
      body: Column(
        children: [
          ToggleItemWithHolder(
            title: 'حجم الشحنة',
            items: shipTypeOptions,
            selectedItem: controller.selectedShippingMethod,
            onChooseItem: (ItemModel item) {
              late Widget bottomSheetBody;
              if (item.id == 0) {
                bottomSheetBody = const _ParcelSheetBody();
              } else {
                bottomSheetBody = const _ContainerSheetBody();
              }
              Get.bottomSheet(
                  HeadLineBottomSheet(
                    bottomSheetTitle: item.text,
                    body: bottomSheetBody,
                    height: Get.height / 1.2,
                  ),
                  isScrollControlled: true);
            },
          ),
          TextFieldInputWithHolder(
            hint: 'وصف البضاعة مثل: أجهزة إلكترونية للإستخدام الشخصي',
            controller: controller.description,
            maxLines: 3,
          ),
          Obx(
            () => TextFieldInputWithDropDownWithHolder(
              title: 'قيمة الفاتورة',
              firstInputHint: 'السعر',
              firstInputFlex: 2,
              secondInputHint: 'العملة',
              toolTipMsg:
                  'قيمة المبلغ المذكور في الفاتورة التجارية المراد تخليصها',
              firstInputController: controller.total,
              selectedDropDownValue: controller.selectedCurrency,
              source: controller.currencies
                  .map((e) => DropdownMenuItem(
                        value: e.id.toString(),
                        child: Text(e.name),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _AdditionalServices extends GetView<AddEditCustomsClearanceController> {
  const _AdditionalServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdditionalServiceStepView(
      body: Obx(() => Column(
            children: [
              ServiceItemWithHolder(
                title: 'خدمة التخزين',
                height: Get.height / 3,
                text: controller.numberOfStorage.value > 0 ? 'تم' : null,
                onDelete: () => controller.numberOfStorage(0),
                body: SetNumberCount(
                  number: controller.numberOfStorage,
                  title: 'عدد أيام التخزين',
                ),
              ),
              ServiceItemWithHolder(
                title: 'هل يوجد بند جمركي',
                bottomSheetTitle: 'إضافة بند جمركي',
                height: Get.height / 2,
                text: controller.customsClauseList.isNotEmpty ? 'تم' : null,
                onDelete: () => controller.customsClauseList.clear(),
                body: CustomsClause(
                  customsClause: controller.customsClauseList,
                ),
              ),
              CheckerWithHolder(
                title: 'خدمة إستخراج الشهادات اللازمة',
                active: controller.certificates
                    .any((element) => element.selected.value)
                    .obs,
                bottomSheetTitle: 'الشهادات',
                body: ChooseCertificates(controller.certificates),
                height: Get.height / 1.6,
              ),
              TextFieldInputWithHolder(
                hint: 'الملاحظات',
                controller: controller.note,
                maxLines: 3,
              )
            ],
          )),
    );
  }
}
