part of '../../../air_freight_service.dart';

class AddEditAirFreightServiceController extends GetxController {
  final GetParticularEnvDataUseCase _getParticularEnvDataUseCase;
  final AddAirFreightUseCase _addAirFreightUseCase;
  final UpdateAirFreightUseCase _updateAirFreightUseCase;
  final DownloadFileUseCase _downloadFileUseCase;
  AddEditAirFreightServiceController(
    this._downloadFileUseCase,
    this._getParticularEnvDataUseCase,
    this._addAirFreightUseCase,
    this._updateAirFreightUseCase,
  );

  PageController pageController = PageController();

  final OrderModel? orderData = Get.arguments;
  bool get isAdd => orderData == null;

  RxInt currentStep = 0.obs;

  RxBool loading = false.obs;

  final formKey = GlobalKey<FormBuilderState>();

  RxInt selectedThrough = (-1).obs;

  String get pageTitle {
    switch (currentStep.value) {
      case 0:
        return 'تعبئة الطلب';
      case 1:
        return 'تفاصيل البضاعة';
      case 2:
        return 'خدمات إضافية';
      case 3:
        return 'تأكيد الطلب';
      case 4:
        return 'إرسال الطلب';
    }
    return '';
  }

  List<Widget> children = const [
    _FillData(),
    _OrderDetails(),
    _AdditionalServices(),
    OrderSendSuccessfullyStepView(),
  ];

  RxInt selectedShippingType = 0.obs;

  RxString fromShipmentLocation = ''.obs,
      fromCountryId = ''.obs,
      toShipmentLocation = ''.obs,
      toCountryId = ''.obs,
      selectedShipmentReady = ''.obs,
      selectedCurrencyId = ''.obs;
  TextEditingController name = TextEditingController(),
      fromCity = TextEditingController(),
      toCity = TextEditingController(),
      fromShipmentOther = TextEditingController(),
      toShipmentOther = TextEditingController(),
      price = TextEditingController(),
      content = TextEditingController();
  LocationDetails fromCityLocationDetails = LocationDetails(),
      toCityLocationDetails = LocationDetails();

  List<DataModel> countries = <DataModel>[], certificates = <DataModel>[].obs;

  RxList<DataModel> currency = <DataModel>[].obs;

  RxList<AirFreightItemModel> items = <AirFreightItemModel>[
    AirFreightItemModel.nexItem(),
  ].obs;

  RxBool enableInsurance = false.obs, enableCustomsClearance = false.obs;

  String? get nextTitle => currentStep.value == children.length - 1
      ? (isAdd ? 'إرسال الطلب' : 'تعديل')
      : null;

  @override
  void onInit() {
    _fillData();
    super.onInit();
  }

  void _fillData() async {
    loading(true);
    await _getData('countries', onSuccess: (data) => countries.addAll(data));
    await _getData('certificates',
        onSuccess: (data) => certificates.addAll(data));
    await _getData('currencies', onSuccess: (data) => currency.addAll(data));
    if (orderData == null) {
      loading(false);
      return;
    }
    final order = orderData as AirFreightOrder;
    name.text = orderData!.title;
    content.text = order.content;
    selectedShippingType(order.shipmentTypeId);
    fromShipmentLocation(order.fromShipmentLocation);
    fromShipmentOther.text = order.fromShipmentOtherLocation.toString();
    fromCountryId(order.fromCountryId.toString());
    fromCity.text = order.fromCity;
    fromCityLocationDetails = LocationDetails(
      name: order.fromCity,
      lat: double.tryParse(order.fromCityLat) ?? 0.0,
      long: double.tryParse(order.fromCityLng) ?? 0.0,
    );
    didFieldChanged(
      AirFreightInputsKeys.shipmentFrom.name,
      value: '_',
    );
    toShipmentLocation(order.toShipmentLocation);
    toShipmentOther.text = order.toShipmentOtherLocation.toString();
    toCountryId(order.toCountryId.toString());
    toCity.text = order.toCity;
    toCityLocationDetails = LocationDetails(
      name: order.toCity,
      lat: double.tryParse(order.toCityLat) ?? 0.0,
      long: double.tryParse(order.toCityLng) ?? 0.0,
    );
    didFieldChanged(
      AirFreightInputsKeys.shipmentTo.name,
      value: '_',
    );
    price.text = order.total;
    selectedCurrencyId(order.currencyId.toString());
    selectedShipmentReady(order.shipmentReady);
    selectedThrough(order.through == 'pallet' ? 0 : 1);
    enableInsurance(order.insurance == 'yes' ? true : false);
    enableCustomsClearance(order.customsClearance == 'yes' ? true : false);
    for (var e in order.certificates) {
      final item =
          certificates.firstWhereOrNull((element) => element.id == e.id);
      if (item == null) continue;
      item.selected(true);
    }
    if (order.goods.isNotEmpty) {
      items.clear();
      for (var goodItem in order.goods) {
        File image = File('');
        if(goodItem.image != null){
          await _downloadFile(
            goodItem.image!,
            onSuccess: (String filePath) => image = File(filePath),
          );
        }

        items.add(AirFreightItemModel(
          length: TextEditingController(text: goodItem.length),
          width: TextEditingController(text: goodItem.width),
          height: TextEditingController(text: goodItem.height),
          image: image.obs,
          quantity: TextEditingController(text: goodItem.quantity),
          cm: TextEditingController(text: goodItem.cm),
          unitType: (goodItem.unitType == 'pallet' ? 1 : 0).obs,
          weightPerUnit: TextEditingController(text: goodItem.weightPerUnit),
          name: TextEditingController(text: goodItem.name),
        ));
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

  void didFieldChanged(String fieldName, {required String value}) =>
      formKey.currentState?.fields[fieldName]!.didChange(value);

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

  AirFreightData get _airFreightData => AirFreightData(
        id: isAdd ? 0 : orderData!.id,
        title: name.text,
        shipmentType: selectedShippingType.value == 0 ? 'import' : 'export',
        fromShipmentLocation: fromShipmentLocation.value,
        fromShipmentOtherLocation: fromShipmentOther.text,
        fromCountryId: fromCountryId.value,
        fromCity: fromCity.text,
        fromCityLat: fromCityLocationDetails.lat.toString(),
        fromCityLng: fromCityLocationDetails.long.toString(),
        toShipmentLocation: toShipmentLocation.value,
        toShipmentOtherLocation: toShipmentOther.text,
        toCountryId: toCountryId.value,
        toCity: toCity.text,
        toCityLat: toCityLocationDetails.lat.toString(),
        toCityLng: toCityLocationDetails.long.toString(),
        total: price.text,
        currencyId: selectedCurrencyId.value,
        shipmentReady: selectedShipmentReady.value,
        content: content.text,
        insurance: enableInsurance.value ? 'yes' : 'no',
        customsClearance: enableCustomsClearance.value ? 'yes' : 'no',
        certificates: certificates.any((element) => element.selected.value)
            ? 'yes'
            : 'no',
        through: selectedThrough.value == 0 ? 'pallet' : 'carton',
        certificate: certificates
            .where((e) => e.selected.value)
            .map((element) => element.id.toString())
            .toList(),
        name: items.map((element) => element.name.text).toList(),
        length: items.map((element) => element.length.text).toList(),
        height: items.map((element) => element.height.text).toList(),
        width: items.map((element) => element.width.text).toList(),
        weightPerUnit:
            items.map((element) => element.weightPerUnit.text).toList(),
        cm: items.map((element) => element.cm.text).toList(),
        quantity: items.map((element) => element.quantity.text).toList(),
        image: items.map((element) => element.image.value.path).toList(),
      );

  Future<void> _createOrder() async {
    final params = AirFreightUseCaseParams(
      loading: loading,
      data: _airFreightData,
    );
    final result = await _addAirFreightUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) async {
        showAlertMessage(data['message']);
        Get.offAllNamed(Routes.root);
      },
    );
  }

  Future<void> _updateOrder() async {
    final params = AirFreightUseCaseParams(
      loading: loading,
      data: _airFreightData,
    );
    final result = await _updateAirFreightUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) async {
        showAlertMessage(data['message']);
        Get.back(result: true);
      },
    );
  }
}
