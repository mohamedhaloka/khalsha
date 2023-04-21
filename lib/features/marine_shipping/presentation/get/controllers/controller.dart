part of '../../../marine_shipping.dart';

class AddEditMarineShippingServiceController extends GetxController {
  final GetParticularEnvDataUseCase _getParticularEnvDataUseCase;
  final AddMarineShipmentUseCase _addMarineShipmentUseCase;
  final UpdateMarineShipmentUseCase _updateMarineShipmentUseCase;
  final DownloadFileUseCase _downloadFileUseCase;
  AddEditMarineShippingServiceController(
    this._downloadFileUseCase,
    this._getParticularEnvDataUseCase,
    this._addMarineShipmentUseCase,
    this._updateMarineShipmentUseCase,
  );

  PageController pageController = PageController();

  // final OrderModel? orderData = Get.arguments;
  // bool get isAdd => orderData == null;

  RxInt currentStep = 0.obs;

  RxBool loading = false.obs;

  final formKey = GlobalKey<FormBuilderState>();

  List<ItemModel> throughOptions = const <ItemModel>[
    ItemModel(
      text: 'إجمالي الشحنة',
      id: 0,
    ),
    ItemModel(
      text: 'نوع الوحدة',
      id: 1,
    )
  ];
  RxInt selectedThrough = 0.obs;

  String get pageTitle {
    switch (currentStep.value) {
      case 0:
        return 'تعبئة الطلب';
      case 1:
        return 'خدمات إضافية';
      case 2:
        return 'تأكيد الطلب';
      case 3:
        return 'إرسال الطلب';
    }
    return '';
  }

  List<Widget> children = const [
    _FillData(),
    _AdditionalServices(),
    OrderSendSuccessfullyStepView(),
  ];

  RxInt selectedShippingType = 0.obs;
  RxInt selectedShipmentSize = (-1).obs;

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

  RxList<ContainerMarineShipmentModel> containers =
      <ContainerMarineShipmentModel>[
    ContainerMarineShipmentModel.nexItem(),
  ].obs;

  RxList<GoodsTotalShipmentMarineShipmentModel> goodsTotalShipment =
      <GoodsTotalShipmentMarineShipmentModel>[
    GoodsTotalShipmentMarineShipmentModel.nexItem(),
  ].obs;
  RxList<GoodsUnitTypeMarineShipmentModel> goodsUnitType =
      <GoodsUnitTypeMarineShipmentModel>[
    GoodsUnitTypeMarineShipmentModel.nexItem(),
  ].obs;

  RxBool enableInsurance = false.obs,
      enableCustomsClearance = false.obs,
      enableCertificate = false.obs;

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
    // if (orderData == null) {
    //   loading(false);
    //   return;
    // }
    // name.text = orderData!.title;
    // content.text = orderData!.content!;
    // selectedShippingType(orderData!.shipmentTypeId);
    // fromShipmentLocation(orderData!.fromshipmentLocation);
    // fromShipmentOther.text = orderData!.fromshipmentOtherLocation.toString();
    // fromCountryId(orderData!.fromcountryId.toString());
    // fromCity.text = orderData!.fromcity!;
    // fromCityLocationDetails = LocationDetails(
    //   name: orderData!.fromcity,
    //   lat: double.tryParse(orderData!.fromcityLat!) ?? 0.0,
    //   long: double.tryParse(orderData!.fromcityLng!) ?? 0.0,
    // );
    // toShipmentLocation(orderData!.toshipmentLocation);
    // toShipmentOther.text = orderData!.toshipmentOtherLocation.toString();
    // toCountryId(orderData!.tocountryId.toString());
    // toCity.text = orderData!.tocity!;
    // toCityLocationDetails = LocationDetails(
    //   name: orderData!.tocity,
    //   lat: double.tryParse(orderData!.tocityLat!) ?? 0.0,
    //   long: double.tryParse(orderData!.tocityLng!) ?? 0.0,
    // );
    // // price.text = orderData!.total!;
    // // selectedCurrencyId(orderData!.currencyId.toString());
    // selectedShipmentReady(orderData!.shipmentReady);
    // enableInsurance(orderData!.insurance == 'yes' ? true : false);
    // enableCustomsClearance(orderData!.customsClearance == 'yes' ? true : false);
    // for (var e in orderData!.certificates!) {
    //   final item =
    //       certificates.firstWhereOrNull((element) => element.id == e.id);
    //   if (item == null) continue;
    //   item.selected(true);
    //   if (item.selected.value) enableCertificate(true);
    // }
    // selectedShipmentSize(orderData!.shipmentSizesId);
    // if (orderData!.shipmentSizes == 'goods') {
    //   if (orderData!.goods!.isNotEmpty) {
    //     goodsUnitType.clear();
    //     goodsTotalShipment.clear();
    //     for (var goodItem in orderData!.goods!) {
    //       selectedThrough(goodItem.through == 'unit_type' ? 1 : 0);
    //       if (goodItem.through == 'unit_type') {
    //         File image = File('');
    //         await _downloadFile(
    //           goodItem.image!,
    //           onSuccess: (String filePath) => image = File(filePath),
    //         );
    //         goodsUnitType.add(GoodsUnitTypeMarineShipmentModel(
    //           length: TextEditingController(text: goodItem.length),
    //           width: TextEditingController(text: goodItem.width),
    //           height: TextEditingController(text: goodItem.height),
    //           image: image.obs,
    //           quantity: TextEditingController(text: goodItem.quantity),
    //           cm: TextEditingController(text: goodItem.cm),
    //           unitType: (goodItem.unitType == 'pallet' ? 1 : 0).obs,
    //           weightPerUnit:
    //               TextEditingController(text: goodItem.weightPerUnit),
    //         ));
    //       } else {
    //         goodsTotalShipment.add(GoodsTotalShipmentMarineShipmentModel(
    //           totalWeight: TextEditingController(text: goodItem.totalWeight),
    //           overallSize: TextEditingController(text: goodItem.overallSize),
    //           quantity: TextEditingController(text: goodItem.quantity),
    //         ));
    //       }
    //     }
    //   }
    // } else {
    //   if (orderData!.containers!.isNotEmpty) {
    //     containers.clear();
    //     for (var containerItem in orderData!.containers!) {
    //       late File image;
    //       await _downloadFile(
    //         containerItem.image!,
    //         onSuccess: (String filePath) => image = File(filePath),
    //       );
    //       containers.add(
    //         ContainerMarineShipmentModel(
    //           containerCount: containerItem.containerCount!.obs,
    //           file: image.obs,
    //           containerType: containerItem.containerType!.obs,
    //           containerContent:
    //               TextEditingController(text: containerItem.content),
    //         ),
    //       );
    //     }
    //   }
    // }

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
      // if (isAdd) {
      _createOrder();
      // return;
      // }
      // _updateOrder();
      return;
    }

    formKey.currentState?.save();

    if (!formKey.currentState!.validate()) return;

    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  MarineShipmentData get _marineShipmentData => MarineShipmentData(
        id: 0, //isAdd ? 0 : orderData!.id,
        title: name.text,
        shipmentType: selectedShippingType.value == 0 ? 'import' : 'export',
        fromShipmentLocation: fromShipmentLocation.value,
        fromShipmentOtherLocation: fromShipmentOther.text,
        fromCountryId: fromCountryId.value,
        fromCity: fromCityLocationDetails.name.toString(),
        fromCityLat: fromCityLocationDetails.lat.toString(),
        fromCityLng: fromCityLocationDetails.long.toString(),
        toShipmentLocation: toShipmentLocation.value,
        toShipmentOtherLocation: toShipmentOther.text,
        toCountryId: toCountryId.value,
        toCity: toCityLocationDetails.name.toString(),
        toCityLat: toCityLocationDetails.lat.toString(),
        toCityLng: toCityLocationDetails.long.toString(),
        total: price.text,
        currencyId: selectedCurrencyId.value,
        shipmentReady: selectedShipmentReady.value,
        content: content.text,
        insurance: enableInsurance.value ? 'yes' : 'no',
        customsClearance: enableCustomsClearance.value ? 'yes' : 'no',
        certificates: enableCertificate.value ? 'yes' : 'no',
        shipmentSizes: selectedShipmentSize.value == 0 ? 'container' : 'goods',
        through: selectedShipmentSize.value == 0
            ? null
            : selectedThrough.value == 0
                ? 'total_shipment'
                : 'unit_type',
        certificate: certificates
            .where((e) => e.selected.value)
            .map((element) => element.id.toString())
            .toList(),
        containerType:
            containers.map((element) => element.containerType.value).toList(),
        containerCount: containers
            .map((element) => element.containerCount.value.toString())
            .toList(),
        containerContent:
            containers.map((element) => element.containerContent.text).toList(),
        goodsTotalWeight: goodsTotalShipment
            .map((element) => element.totalWeight.text)
            .toList(),
        goodsOverallSize: goodsTotalShipment
            .map((element) => element.overallSize.text)
            .toList(),
        goodsUnitType: goodsUnitType
            .map(
                (element) => element.unitType.value == 0 ? 'pallet' : 'cartoon')
            .toList(),
        goodsLength:
            goodsUnitType.map((element) => element.length.text).toList(),
        goodsHeight:
            goodsUnitType.map((element) => element.height.text).toList(),
        goodsWidth: goodsUnitType.map((element) => element.width.text).toList(),
        goodsWeightPerUnit:
            goodsUnitType.map((element) => element.weightPerUnit.text).toList(),
        goodsCM: goodsUnitType.map((element) => element.cm.text).toList(),
        goodsQuantity: selectedThrough.value == 0
            ? goodsTotalShipment
                .map((element) => element.quantity.text)
                .toList()
            : goodsUnitType.map((element) => element.quantity.text).toList(),
        image: selectedShipmentSize.value == 0
            ? containers.map((element) => element.file.value.path).toList()
            : goodsUnitType.map((element) => element.image.value.path).toList(),
      );

  Future<void> _createOrder() async {
    final params = MarineShipmentUseCaseParams(
      loading: loading,
      data: _marineShipmentData,
    );
    final result = await _addMarineShipmentUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) async {
        showAlertMessage(data['message']);
        Get.offAllNamed(Routes.root);
      },
    );
  }

  Future<void> _updateOrder() async {
    final params = MarineShipmentUseCaseParams(
      loading: loading,
      data: _marineShipmentData,
    );
    final result = await _updateMarineShipmentUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) async {
        showAlertMessage(data['message']);
        Get.back(result: true);
      },
    );
  }
}
