part of '../../../land_shipping.dart';

class AddEditLandShippingServiceController extends GetxController {
  final GetParticularEnvDataUseCase _getParticularEnvDataUseCase;
  final AddLandShippingUseCase _addLandShippingUseCase;
  final UpdateLandShippingUseCase _updateLandShippingUseCase;
  AddEditLandShippingServiceController(
    this._getParticularEnvDataUseCase,
    this._addLandShippingUseCase,
    this._updateLandShippingUseCase,
  );

  RxBool isInternationalShipping =
      (Get.arguments['isInternationalShipping'] as bool).obs;

  final formKey = GlobalKey<FormBuilderState>();

  List<Widget> children = const [
    _FillData(),
    _AdditionalServices(),
    _PickLocations(),
    ConfirmOrderStepView(),
    OrderSendSuccessfullyStepView(),
  ];

  bool get isAdd => true;

  RxInt currentStep = 0.obs;

  PageController pageController = PageController();

  String? get nextTitle => currentStep.value == children.length - 1
      ? (isAdd ? 'إضافة' : 'تعديل')
      : null;

  RxBool loading = false.obs;

  String get pageTitle {
    switch (currentStep.value) {
      case 0:
        return 'تعبئة الطلب';
      case 1:
        return 'خدمات إضافية';
      case 2:
        return 'تحديد الموقع';
      case 3:
        return 'تأكيد الطلب';
      case 4:
        return 'إرسال الطلب';
    }
    return '';
  }

  TextEditingController name = TextEditingController(),
      content = TextEditingController();

  RxList<DataModel> countries = <DataModel>[].obs,
      trucks = <DataModel>[].obs,
      shipmentTypes = <DataModel>[].obs;

  RxInt shippingType = 0.obs;
  RxInt goodsType = 0.obs;

  Rx<DataModel> fromCountry = DataModel.empty().obs,
      toCountry = DataModel.empty().obs,
      truck = DataModel.empty().obs,
      shipmentType = DataModel.empty().obs;

  RxList<BundledGoodsModel> bundledGoodsItems = <BundledGoodsModel>[
    BundledGoodsModel.newItem(),
  ].obs;

  RxInt storageDays = 0.obs;
  RxBool hasFlammable = false.obs;
  RxString workersType = ''.obs;

  DateTime loadingDate = DateTime.now(),
      deliveryDate = DateTime.now().add(const Duration(days: 1));

  TextEditingController recipientName = TextEditingController(),
      recipientMobile = TextEditingController();

  RxList<LandShippingServiceModel> serviceData = [
    LandShippingServiceModel.newItem(),
  ].obs;

  RxList<LoadingUnLoadingLocationsModel> loadingUnloadingData = [
    LoadingUnLoadingLocationsModel.newItem(),
  ].obs;

  @override
  void onInit() {
    shippingType(getValue('shippingType', defaultValue: 0));
    goodsType(getValue('goodsType', defaultValue: 1));
    _getData('countries', onSuccess: (data) => countries.addAll(data));
    _getData('shipmenttypes', onSuccess: (data) => shipmentTypes.addAll(data));
    _getData('trucks', onSuccess: (data) => trucks.addAll(data));
    super.onInit();
  }

  int getValue(String key, {required int defaultValue}) {
    final data = Get.arguments as Map<String, dynamic>;
    if (data.containsKey(key)) return data[key];
    return defaultValue;
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

  void didFieldChanged(String fieldName, {required String value}) =>
      formKey.currentState?.fields[fieldName]!.didChange(value);

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

  LandShippingData get _landShippingData => LandShippingData(
        orderId: '',
        recipientMobile: recipientMobile.text,
        recipientName: recipientName.text,
        goodsType: goodsType.value == 0 ? 'bundled_goods' : 'private_transfer',
        wantStorage: storageDays.value > 0 ? 'yes' : 'no',
        content: content.text,
        title: name.text,
        shipmentTypeId: shipmentType.value.id.toString(),
        fromCountryId: fromCountry.value.id.toString(),
        toCountryId: toCountry.value.id.toString(),
        storageDays: storageDays.string,
        flammable: hasFlammable.value ? 'yes' : 'no',
        internationalShipping: isInternationalShipping.value ? 'yes' : 'no',
        shippingType: shippingType.value == 0 ? 'personal' : 'commercial',
        truckId: truck.value.id.toString(),
        workers: workersType.value,
        loadingDate: loadingDate.toString(),
        deliveryDate: deliveryDate.toString(),
        loading: loadingUnloadingData
            .map((element) => element.loadingLocation.text)
            .toList(),
        loadingLat: loadingUnloadingData
            .map((element) => element.loadingLocationDetails.lat.toString())
            .toList(),
        loadingLng: loadingUnloadingData
            .map((element) => element.loadingLocationDetails.long.toString())
            .toList(),
        descLoading: loadingUnloadingData
            .map((element) => element.loading.value)
            .toList(),
        delivery: loadingUnloadingData
            .map((element) => element.unloadingLocation.text)
            .toList(),
        deliveryLat: loadingUnloadingData
            .map((element) => element.unloadingLocationDetails.lat.toString())
            .toList(),
        deliveryLng: loadingUnloadingData
            .map((element) => element.unloadingLocationDetails.long.toString())
            .toList(),
        descDelivery: loadingUnloadingData
            .map((element) => element.unloading.value)
            .toList(),
        bundleUnit:
            bundledGoodsItems.map((element) => element.unit.value).toList(),
        bundleTotalWeight: bundledGoodsItems
            .map((element) => element.totalWeight.text)
            .toList(),
        bundleQuantity:
            bundledGoodsItems.map((element) => element.quantity.text).toList(),
        bundleName:
            bundledGoodsItems.map((element) => element.name.text).toList(),
        bundleImage: bundledGoodsItems
            .map((element) => element.image.value.path)
            .toList(),
        name: serviceData.map((element) => element.item.text).toList(),
        quantity: serviceData.map((element) => element.quantity.text).toList(),
        pack: serviceData
            .map((element) => element.pack.value ? 'yes' : 'no')
            .toList(),
        unpack: serviceData
            .map((element) => element.unpack.value ? 'yes' : 'no')
            .toList(),
        packaging: serviceData
            .map((element) => element.packaging.value ? 'yes' : 'no')
            .toList(),
      );

  Future<void> _createOrder() async {
    final params = LandShippingUseCaseParams(
      loading: loading,
      data: _landShippingData,
    );
    final result = await _addLandShippingUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) async {
        showAlertMessage(data['message']);
        // Get.offAllNamed(Routes.root);
      },
    );
  }

  Future<void> _updateOrder() async {
    final params = LandShippingUseCaseParams(
      loading: loading,
      data: _landShippingData,
    );
    final result = await _updateLandShippingUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) async {
        showAlertMessage(data['message']);
        Get.back(result: true);
      },
    );
  }
}
