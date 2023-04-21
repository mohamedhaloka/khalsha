part of '../../../customs_clearance.dart';

class AddEditCustomsClearanceController extends GetxController {
  final GetParticularEnvDataUseCase _getParticularEnvDataUseCase;
  final AddCustomsClearanceUseCase _addCustomsClearanceUseCase;
  final UpdateCustomsClearanceUseCase _updateCustomsClearanceUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final DownloadFileUseCase _downloadFileUseCase;
  final DeleteFileUseCase _deleteFileUseCase;
  AddEditCustomsClearanceController(
    this._getParticularEnvDataUseCase,
    this._addCustomsClearanceUseCase,
    this._uploadImageUseCase,
    this._downloadFileUseCase,
    this._updateCustomsClearanceUseCase,
    this._deleteFileUseCase,
  );

  final OrderModel? orderModel = Get.arguments;

  bool get isAddMode => orderModel == null;

  List<Widget> children = const [
    _FillData(),
    _AdditionalServices(),
    AttachFilesStepView(),
    OrderSendSuccessfullyStepView(),
  ];

  PageController pageController = PageController();

  RxInt currentStep = 0.obs;

  String get pageTitle {
    switch (currentStep.value) {
      case 0:
        return 'تعبئة الطلب';
      case 1:
        return 'خدمات إضافية';
      case 2:
        return 'رفع الملفات';
      case 3:
        return 'إرسال الطلب';
    }
    return '';
  }

  String get btnTxt {
    if (currentStep.value == 3) {
      if (isAddMode) return 'اطلب';
      return 'تعديل';
    }
    return 'التالي';
  }

  RxInt selectedShippingField = 0.obs;

  RxInt selectedShippingType = 0.obs;

  Rx<DataModel> selectedShippingPort = DataModel.empty().obs;
  List<DataModel> shippingPorts = <DataModel>[];

  RxString selectedGoodType = ''.obs;
  RxList<DataModel> goodsTypes = <DataModel>[].obs,
      certificates = <DataModel>[].obs,
      currencies = <DataModel>[].obs;

  RxInt selectedShippingMethod = (-1).obs;
  RxInt numberOfStorage = 0.obs;

  RxList<TextEditingController> customsClauseList =
      <TextEditingController>[].obs;

  TextEditingController name = TextEditingController(),
      deliverTo = TextEditingController(),
      note = TextEditingController(),
      description = TextEditingController(),
      total = TextEditingController();

  LocationDetails locationDetails = LocationDetails();

  RxString selectedCurrency = ''.obs;

  RxList<ParcelDataModel> parcel = <ParcelDataModel>[
    ParcelDataModel.newItem(),
  ].obs;
  RxList<ContainerDataModel> container = <ContainerDataModel>[
    ContainerDataModel.newItem(),
  ].obs;

  RxList<FileModel> files = <FileModel>[].obs;

  RxBool loading = false.obs;

  List<int> deletedFilesIds = <int>[];
  List<String> newFilesPath = <String>[];

  @override
  void onInit() {
    _fillData();
    super.onInit();
  }

  void _fillData() async {
    loading(true);
    await _getData('shippingports',
        onSuccess: (data) => shippingPorts.addAll(data));
    await _getData('goodstypes', onSuccess: (data) => goodsTypes.addAll(data));
    await _getData('certificates',
        onSuccess: (data) => certificates.addAll(data));
    await _getData('currencies', onSuccess: (data) => currencies.addAll(data));

    if (orderModel == null) {
      loading(false);
      return;
    }
    CustomsClearanceOrder customsOrder = orderModel as CustomsClearanceOrder;
    name.text = orderModel!.title;
    selectedShippingField(customsOrder.chargeFieldId);
    selectedShippingType(customsOrder.shipmentTypeId);
    selectedShippingPort(customsOrder.shippingPort);
    deliverTo.text = customsOrder.deliveryTo;
    description.text = customsOrder.content;
    note.text = customsOrder.notes;
    total.text = customsOrder.total;
    selectedCurrency(customsOrder.currency.id.toString());
    selectedShippingMethod(customsOrder.shippingMethodId);
    if (selectedShippingMethod.value == 0) {
      parcel.clear();
      parcel.addAll(customsOrder.parcelDataList);
    } else {
      container.clear();
      container.addAll(customsOrder.containerDataList);
    }
    numberOfStorage(customsOrder.storageDaysNumber);
    customsClauseList.addAll(customsOrder.customsClauseDataList);
    for (var e in customsOrder.certificates) {
      final item =
          certificates.firstWhereOrNull((element) => element.id == e.id);
      item?.selected(true);
    }

    for (var file in customsOrder.files) {
      _downloadFile(file);
    }
    loading(false);
  }

  void chooseLocation() async {
    final result = await Get.toNamed(Routes.map, arguments: locationDetails);
    if (result == null) return;
    if (result is LocationDetails) {
      locationDetails = result;
      deliverTo.text = result.name ?? '';
    }
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

  Future<void> _downloadFile(OrderFile orderFile) async {
    final params = DownloadFileUseCaseParams(
      loading: loading,
      url: orderFile.fullPath!,
    );
    final result = await _downloadFileUseCase.execute(params);
    result.fold((_) => _, (r) {
      log(r, name: 'FILE PATH');
      files.add(FileModel(
        id: orderFile.id,
        file: File(r),
        type: orderFile.mimtype!,
      ));
    });
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
      if (isAddMode) {
        _createOrder();
        return;
      }
      _updateOrder();
      return;
    }

    if (_anyInputsIsEmpty) return;
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  bool get _validateFieldInputsIsEmpty {
    return name.text.isEmpty ||
        deliverTo.text.isEmpty ||
        total.text.isEmpty ||
        selectedCurrency.value == '' ||
        description.text.isEmpty;
  }

  bool get _validateParcelFieldInputsIsEmpty {
    if (selectedShippingMethod.value == 1) return false;
    if (selectedShippingMethod.value == 0 && parcel.isEmpty) {
      return true;
    } else {
      bool hasEmptyData = false;
      for (var section in parcel) {
        if (section.quantity.text.isEmpty ||
            section.quantity.text.isEmpty ||
            section.quantity.text.isEmpty ||
            section.parcelType.value == '' ||
            section.parcelType.value == '') hasEmptyData = true;
      }
      return hasEmptyData;
    }
  }

  bool get _validateContainerFieldInputsIsEmpty {
    if (selectedShippingMethod.value == 0) return false;
    if (selectedShippingMethod.value == 1 && container.isEmpty) {
      return true;
    } else {
      bool hasEmptyData = false;
      for (var section in container) {
        if (section.containerCount.text.isEmpty ||
            section.goodsType.value == '' ||
            section.containerSize.value == '' ||
            section.containerType.value == '') hasEmptyData = true;
      }
      return hasEmptyData;
    }
  }

  bool get _anyInputsIsEmpty {
    switch (currentStep.value) {
      case 0:
        return _validateFieldInputsIsEmpty ||
            _validateParcelFieldInputsIsEmpty ||
            _validateContainerFieldInputsIsEmpty;
      case 2:
        return files.isEmpty;
    }
    return false;
  }

  CustomsClearanceData get _customsClearanceData => CustomsClearanceData(
        orderId: isAddMode ? null : orderModel!.id,
        shippingMethod:
            selectedShippingMethod.value == 0 ? 'parcel' : 'container',
        parcelType: selectedShippingMethod.value == 0
            ? parcel.map((element) => element.parcelType.value).toList()
            : [],
        quantity: selectedShippingMethod.value == 0
            ? parcel.map((element) => element.quantity.text).toList()
            : [],
        totalWeight: selectedShippingMethod.value == 0
            ? parcel.map((element) => element.totalWeight.text).toList()
            : [],
        totalSize: selectedShippingMethod.value == 0
            ? parcel.map((element) => element.totalSize.text).toList()
            : [],
        goodTypeId: selectedShippingMethod.value == 0
            ? parcel.map((element) => element.goodsType.value).toList()
            : container.map((element) => element.goodsType.value).toList(),
        otherParcel: selectedShippingMethod.value == 0
            ? parcel.map((element) => element.otherParcelName.text).toList()
            : [],
        containerType: selectedShippingMethod.value == 0
            ? []
            : container.map((element) => element.containerType.value).toList(),
        containerCount: selectedShippingMethod.value == 0
            ? []
            : container.map((element) => element.containerCount.text).toList(),
        containerSize: selectedShippingMethod.value == 0
            ? []
            : container.map((element) => element.containerSize.value).toList(),
        notes: note.text,
        certificates: certificates.isEmpty ? 'no' : 'yes',
        certificate: certificates
            .where((e) => e.selected.value)
            .map((e) => e.id.toString())
            .toList(),
        method: isAddMode ? null : 'PUT',
        total: total.text,
        title: name.text,
        chargeField:
            selectedShippingField.value == 0 ? 'personal' : 'commercial',
        content: description.text,
        currencyId: '1',
        customsItem: customsClauseList.isNotEmpty ? 'yes' : 'no',
        customsItemIds:
            customsClauseList.map((element) => element.text).toList(),
        deliveryTo: deliverTo.text,
        deliverToLat: locationDetails.lat.toString(),
        deliverToLng: locationDetails.long.toString(),
        shipmentType: selectedShippingType.value == 0 ? 'import' : 'export',
        shippingPortId: selectedShippingPort.value.id.toString(),
        storageDays: numberOfStorage.string,
        wantStorage: numberOfStorage.value > 0 ? 'yes' : 'no',
      );

  Future<void> _createOrder() async {
    final params = CustomsClearanceUseCaseParams(
      loading: loading,
      customsClearanceData: _customsClearanceData,
    );
    final result = await _addCustomsClearanceUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) async {
        showAlertMessage(data['message']);
        await _uploadImages(data['orderId'].toString(),
            listLength: files.length,
            item: (int index) => files[index].file.path);
        Get.offAllNamed(Routes.root);
      },
    );
  }

  Future<void> _uploadImages(String orderId,
      {required int listLength,
      required String Function(int index) item}) async {
    for (int i = 0; i < listLength; i++) {
      final params = UploadImageUseCaseParams(
        loading: loading,
        pageName: 'customsclearance',
        path: 'customclearancestep',
        orderId: orderId,
        field: 'customclearancestep_file',
        filePath: item(i),
      );

      final result = await _uploadImageUseCase.execute(params);
      result.fold(
        (_) => _,
        (successMsg) => showAlertMessage(successMsg),
      );
    }
  }

  Future<void> _updateOrder() async {
    final params = CustomsClearanceUseCaseParams(
      loading: loading,
      customsClearanceData: _customsClearanceData,
    );
    final result = await _updateCustomsClearanceUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) async {
        showAlertMessage(data['message']);
        await _uploadImages(
          data['orderId'].toString(),
          listLength: newFilesPath.length,
          item: (int index) => newFilesPath[index],
        );
        _deleteRemovedFiles();
      },
    );
  }

  Future<void> _deleteRemovedFiles() async {
    for (var deletedFileId in deletedFilesIds) {
      final params = DeleteFileUseCaseParams(
        loading: loading,
        pageName: 'customsclearance',
        id: deletedFileId,
      );
      final result = await _deleteFileUseCase.execute(params);
      result.fold(
        (failure) => showAlertMessage(failure.statusMessage),
        (r) => showAlertMessage(r),
      );
    }
    Get.back(result: true);
  }
}
