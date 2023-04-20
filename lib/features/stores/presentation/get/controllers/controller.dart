part of '../../../stores.dart';

class AddEditStoresServiceController extends GetxController {
  final GetParticularEnvDataUseCase _getParticularEnvDataUseCase;
  final AddWareHouseOrderUseCase _addWareHouseOrderUseCase;
  final UpdateWareHouseOrderUseCase _updateWareHouseOrderUseCase;
  AddEditStoresServiceController(
    this._getParticularEnvDataUseCase,
    this._addWareHouseOrderUseCase,
    this._updateWareHouseOrderUseCase,
  );

  final OrderModel? orderData = Get.arguments;
  bool get isAdd => orderData == null;

  PageController pageController = PageController();
  RxInt currentStep = 0.obs;

  RxBool loading = false.obs;

  String get pageTitle {
    switch (currentStep.value) {
      case 0:
        return 'تعبئة الطلب';
      case 1:
        return 'تفاصيل الشحنة';
      case 2:
        return 'خدمات إضافية';
      case 3:
        return 'إرسال الطلب';
    }
    return '';
  }

  List<Widget> children = const [
    _FillData(),
    ShippingDetailsStepView(),
    _AdditionalServices(),
    OrderSendSuccessfullyStepView(),
  ];

  TextEditingController name = TextEditingController(),
      location = TextEditingController(),
      customWareHouseSpace = TextEditingController(),
      notes = TextEditingController(),
      palletNumber = TextEditingController();

  RxInt selectedShippingField = 0.obs;

  RxList<DataModel> items = <DataModel>[].obs, certificates = <DataModel>[].obs;
  Rx<DataModel> selectedItem = DataModel.empty().obs;

  RxString selectedStorageType = ''.obs,
      selectedSpaceType = ''.obs,
      selectedWareHouseSpace = ''.obs,
      selectedContactType = ''.obs;

  RxBool needPackaging = false.obs,
      exportCertificates = false.obs,
      importCertificates = false.obs,
      farmingProcedures = false.obs;

  LocationDetails locationDetails = LocationDetails();

  List<ItemModel> contactTypesOptions = const <ItemModel>[
    ItemModel(
      text: 'يومي',
      id: 0,
    ),
    ItemModel(
      text: 'شهري',
      id: 1,
    )
  ];
  RxInt contractDays = 0.obs;

  DateTime contractDate = DateTime.now();

  @override
  void onInit() {
    _fillData();
    super.onInit();
  }

  void _fillData() async {
    loading(true);
    await _getData(
      'importer/warehouse/items',
      onSuccess: (data) => items.addAll(data),
    );
    await _getData('certificates',
        onSuccess: (data) => certificates.addAll(data));

    if (orderData == null) {
      loading(false);
      return;
    }
    name.text = orderData!.title;
    selectedShippingField(orderData!.storingPurposeId);
    selectedStorageType(orderData!.storingType);
    selectedItem(orderData!.item);
    locationDetails = LocationDetails(
      lat: double.tryParse(orderData!.addressLat) ?? 0.0,
      long: double.tryParse(orderData!.addressLng) ?? 0.0,
      name: orderData!.address,
    );
    location.text = orderData!.address;
    selectedSpaceType(orderData!.spaceType);
    selectedWareHouseSpace(orderData!.warehouseSpace);
    customWareHouseSpace.text = orderData!.customWarehouseSpace;
    selectedContactType(orderData!.contractType);
    contractDays(orderData!.contractCount);
    notes.text = orderData!.notes;
    palletNumber.text = orderData!.palletCounts.toString();
    print(orderData!.contractStartAt);
    contractDate = orderData!.contractStartAt;

    needPackaging(orderData!.needPackaging == 'yes' ? true : false);
    importCertificates(orderData!.importCertificates == 'yes' ? true : false);
    exportCertificates(orderData!.exportCertificates == 'yes' ? true : false);
    farmingProcedures(orderData!.farmingProcedures == 'yes' ? true : false);
    for (var e in orderData!.certificates) {
      final item =
          certificates.firstWhereOrNull((element) => element.id == e.id);
      item?.selected(true);
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

  void chooseLocation() async {
    final result = await Get.toNamed(Routes.map, arguments: locationDetails);
    if (result == null) return;
    if (result is LocationDetails) {
      locationDetails = result;
      location.text = result.name ?? '';
    }
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

    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  WareHouseData get _wareHouseData => WareHouseData(
        id: isAdd ? 0 : orderData!.id,
        needPackaging: needPackaging.value ? 'yes' : 'no',
        importCertificates: importCertificates.value ? 'yes' : 'no',
        exportCertificates: exportCertificates.value ? 'yes' : 'no',
        farmingProcedures: farmingProcedures.value ? 'yes' : 'no',
        certificates: certificates.any((element) => element.selected.value)
            ? 'yes'
            : 'no',
        notes: notes.text,
        certificate: certificates
            .where((e) => e.selected.value)
            .map((e) => e.id.toString())
            .toList(),
        title: name.text,
        address: location.text,
        addressLat: locationDetails.lat.toString(),
        addressLng: locationDetails.long.toString(),
        contractCount: contractDays.string,
        contractStartAt: contractDate.formatTime(wareHouseDateFormat),
        contractType: selectedContactType.value,
        customWarehouseSpace: customWareHouseSpace.text,
        itemId: selectedItem.value.id.toString(),
        palletCounts: palletNumber.text,
        spaceType: selectedSpaceType.value,
        storingPurpose:
            selectedShippingField.value == 0 ? 'personal' : 'commercial',
        storingType: selectedStorageType.value,
        warehouseSpace: selectedWareHouseSpace.value,
      );

  Future<void> _createOrder() async {
    final params = WareHouseOrderUseCaseParams(
      loading: loading,
      data: _wareHouseData,
    );
    final result = await _addWareHouseOrderUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) async {
        showAlertMessage(data['message']);
        Get.offAllNamed(Routes.root);
      },
    );
  }

  Future<void> _updateOrder() async {
    final params = WareHouseOrderUseCaseParams(
      loading: loading,
      data: _wareHouseData,
    );
    final result = await _updateWareHouseOrderUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) async {
        showAlertMessage(data['message']);
        Get.back(result: true);
      },
    );
  }
}
