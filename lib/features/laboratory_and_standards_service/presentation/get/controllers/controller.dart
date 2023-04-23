part of '../../../laboratory.dart';

class AddEditLaboratoryAndStandardsServiceController extends GetxController {
  final GetParticularEnvDataUseCase _getParticularEnvDataUseCase;
  final AddLaboratoryUseCase _addLaboratoryUseCase;
  final UpdateLaboratoryUseCase _updateLaboratoryUseCase;
  final DownloadFileUseCase _downloadFileUseCase;
  AddEditLaboratoryAndStandardsServiceController(
    this._getParticularEnvDataUseCase,
    this._downloadFileUseCase,
    this._addLaboratoryUseCase,
    this._updateLaboratoryUseCase,
  );

  final OrderModel? orderData = Get.arguments;
  bool get isAdd => orderData == null;

  PageController pageController = PageController();

  RxBool loading = false.obs;

  final formKey = GlobalKey<FormBuilderState>();

  String get pageTitle {
    switch (currentStep.value) {
      case 0:
        return 'تعبئة الطلب';
      case 1:
        return 'خدمات إضافية';

      case 2:
        return 'إرسال الطلب';
    }
    return '';
  }

  List<Widget> children = const [
    _FillData(),
    _AdditionalServices(),
    OrderSendSuccessfullyStepView(),
  ];
  TextEditingController name = TextEditingController(),
      notes = TextEditingController();

  RxList<DataModel> certificates = <DataModel>[].obs,
      services = <DataModel>[].obs;

  Rx<File> testReportPhoto = File('').obs, factoryAduitReport = File('').obs;

  RxList<OrderItemModel> orderItems = <OrderItemModel>[
    OrderItemModel.newItem(),
  ].obs;

  RxInt currentStep = 0.obs;

  @override
  void onInit() {
    _fillData();
    super.onInit();
  }

  void _fillData() async {
    loading(true);
    await _getData(
      'certificates',
      onSuccess: (data) => certificates.addAll(data),
    );
    await _getData(
      'importer/laboratories/item/services',
      onSuccess: (data) => services.addAll(data),
    );
    if (orderData == null) {
      loading(false);
      return;
    }
    final order = orderData as LaboratoryOrder;
    name.text = order.title;
    notes.text = order.notes ?? '';
    if (order.testReport == 'yes') {
      _downloadFile(
        order.testReportPhoto!,
        onSuccess: (String filePath) => testReportPhoto(File(filePath)),
      );
    }
    if (order.factoryAudit == 'yes') {
      _downloadFile(
        order.factoryAuditPhoto!,
        onSuccess: (String filePath) => factoryAduitReport(File(filePath)),
      );
    }
    for (var e in order.certificates) {
      final item =
          certificates.firstWhereOrNull((element) => element.id == e.id);
      item?.selected(true);
    }

    if (order.items.isNotEmpty) {
      orderItems.clear();
      for (var item in order.items) {
        File photoCard = File(''), photoItem = File('');
        await _downloadFile(
          item.photoCard,
          onSuccess: (String filePath) => photoCard = File(filePath),
        );
        await _downloadFile(
          item.photoItem,
          onSuccess: (String filePath) => photoItem = File(filePath),
        );
        orderItems.add(
          OrderItemModel(
            customsCode: TextEditingController(text: item.customsCode),
            factoryName: TextEditingController(text: item.factoryName),
            itemServiceId: item.itemServiceId.toString().obs,
            nameAr: TextEditingController(text: item.name),
            nameEn: TextEditingController(text: item.name),
            photoCard: photoCard.obs,
            photoItem: photoItem.obs,
          ),
        );
      }
    }
    loading(false);
  }

  Future<void> _getData(
    String pageName, {
    required void Function(List<DataModel> data) onSuccess,
  }) async {
    final params = GetParticularEnvDataUseCaseParams(
      loading: false.obs,
      pageName: pageName,
    );
    final result = await _getParticularEnvDataUseCase.execute(params);
    result.fold((_) => _, onSuccess);
  }

  Future<void> _downloadFile(
    String url, {
    required void Function(String filePath) onSuccess,
  }) async {
    final params = DownloadFileUseCaseParams(loading: loading, url: url);
    final result = await _downloadFileUseCase.execute(params);
    result.fold((_) => _, (r) => onSuccess(r));
  }

  void onPageChanged(int index) => currentStep(index);
  void onTapBack() {
    if (currentStep.value == 0) {
      Get.back();
      return;
    }
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onTapNext() {
    if (currentStep.value == children.length - 1) {
      if (isAdd) {
        _createOrder();
        return;
      }
      _updateOrder();
      return;
    }
    formKey.currentState?.save();

    if (!formKey.currentState!.validate()) return;

    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  LaboratoryData get _laboratoryData => LaboratoryData(
        id: isAdd ? 0 : orderData!.id,
        notes: notes.text,
        photoItem:
            orderItems.map((element) => element.photoItem.value.path).toList(),
        photoCard:
            orderItems.map((element) => element.photoCard.value.path).toList(),
        customsCode:
            orderItems.map((element) => element.customsCode.text).toList(),
        nameEn: orderItems.map((element) => element.nameEn.text).toList(),
        nameAr: orderItems.map((element) => element.nameAr.text).toList(),
        itemServiceId:
            orderItems.map((element) => element.itemServiceId.value).toList(),
        title: name.text,
        certificate: certificates
            .where((e) => e.selected.value)
            .map((element) => element.id.toString())
            .toList(),
        factoryName:
            orderItems.map((element) => element.factoryName.text).toList(),
        certificates: certificates.any((element) => element.selected.value)
            ? 'yes'
            : 'no',
        factoryAudit: factoryAduitReport.value.path,
        testReport: testReportPhoto.value.path,
      );

  Future<void> _createOrder() async {
    final params = LaboratoryUseCaseParams(
      loading: loading,
      laboratoryData: _laboratoryData,
    );
    final result = await _addLaboratoryUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) async {
        showAlertMessage(data['message']);
        Get.offAllNamed(Routes.root);
      },
    );
  }

  Future<void> _updateOrder() async {
    final params = LaboratoryUseCaseParams(
      loading: loading,
      laboratoryData: _laboratoryData,
    );
    final result = await _updateLaboratoryUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) async {
        showAlertMessage(data['message']);
        Get.back(result: true);
      },
    );
  }
}
