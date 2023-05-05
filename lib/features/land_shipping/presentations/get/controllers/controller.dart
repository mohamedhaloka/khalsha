part of '../../../land_shipping.dart';

class AddEditLandShippingServiceController extends GetxController {
  final GetParticularEnvDataUseCase _getParticularEnvDataUseCase;
  final AddLandShippingUseCase _addLandShippingUseCase;
  final UpdateLandShippingUseCase _updateLandShippingUseCase;
  final DownloadFileUseCase _downloadFileUseCase;

  AddEditLandShippingServiceController(
    this._getParticularEnvDataUseCase,
    this._addLandShippingUseCase,
    this._updateLandShippingUseCase,
    this._downloadFileUseCase,
  );

  RxBool isInternationalShipping =
      (Get.arguments['isInternationalShipping'] as bool).obs;
  final OrderModel? orderData = (Get.arguments['orderData'] as OrderModel?);

  final formKey = GlobalKey<FormBuilderState>();

  List<Widget> children = const [
    _FillData(),
    _AdditionalServices(),
    _PickLocations(),
    ConfirmOrderStepView(),
    OrderSendSuccessfullyStepView(),
  ];

  bool get isAdd => orderData == null;

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

  RxList<LoadingUnLoadingLocationsModel> locationsData = [
    LoadingUnLoadingLocationsModel.newItem(),
  ].obs;

  @override
  void onInit() {
    _fillData();
    super.onInit();
  }

  void _fillData() async {
    loading(true);
    shippingType(getValue('shippingType', defaultValue: 0));
    goodsType(getValue('goodsType', defaultValue: 1));
    _getData('countries', onSuccess: (data) => countries.addAll(data));
    _getData('shipmenttypes', onSuccess: (data) => shipmentTypes.addAll(data));
    _getData('trucks', onSuccess: (data) => trucks.addAll(data));
    if (orderData == null) {
      loading(false);
      return;
    }
    final order = orderData as LandShippingOrder;
    name.text = order.title;
    fromCountry(order.fromCountry);
    toCountry(order.toCountry);
    goodsType(order.goodsTypeId);
    content.text = order.content;
    truck(order.truck);
    shipmentType(order.shipmentType);

    if (order.bundledGoods.isNotEmpty) {
      bundledGoodsItems.clear();
    }
    for (var item in order.bundledGoods) {
      File imageFile = File('');
      await _downloadFile(
        item.image,
        onSuccess: (String filePath) => imageFile = File(filePath),
      );
      bundledGoodsItems.add(
        BundledGoodsModel(
          image: imageFile.obs,
          name: TextEditingController(text: item.name),
          totalWeight: TextEditingController(text: item.totalWeight),
          unit: item.unit.obs,
          quantity: TextEditingController(text: item.quantity.toString()),
        ),
      );
    }

    if (order.locations.isNotEmpty) {
      locationsData.clear();
    }
    for (var location in order.locations) {
      locationsData.add(
        LoadingUnLoadingLocationsModel(
          loadingLocation: TextEditingController(text: location.loading),
          unloadingLocation: TextEditingController(text: location.delivery),
          loadingLocationDetails: LocationDetails(
            long: double.tryParse(location.loadingLng) ?? 0.0,
            lat: double.tryParse(location.loadingLat) ?? 0.0,
            name: location.loading,
          ),
          unloadingLocationDetails: LocationDetails(
            long: double.tryParse(location.deliveryLng) ?? 0.0,
            lat: double.tryParse(location.deliveryLat) ?? 0.0,
            name: location.delivery,
          ),
          loading: location.descLoading.obs,
          unloading: location.descDelivery.obs,
        ),
      );
    }

    if (order.extraServices.isNotEmpty) {
      serviceData.clear();
    }
    for (var service in order.extraServices) {
      serviceData.add(
        LandShippingServiceModel(
          item: TextEditingController(text: service.name),
          quantity: TextEditingController(text: service.quantity.toString()),
          packaging: (service.packaging == 'yes' ? true : false).obs,
          pack: (service.pack == 'yes' ? true : false).obs,
          unpack: (service.unpack == 'yes' ? true : false).obs,
        ),
      );
    }
    loadingDate = order.loadingDate;
    deliveryDate = order.deliveryDate;
    recipientName.text = order.recipientName;
    recipientMobile.text = order.recipientMobile;

    loading(false);
  }

  int getValue(String key, {required int defaultValue}) {
    final data = Get.arguments as Map<String, dynamic>;
    if (data.containsKey(key)) return data[key];
    return defaultValue;
  }

  Future<void> _downloadFile(
    String url, {
    required void Function(String filePath) onSuccess,
  }) async {
    final params = DownloadFileUseCaseParams(loading: false.obs, url: url);
    final result = await _downloadFileUseCase.execute(params);
    result.fold((_) => _, (r) => onSuccess(r));
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
        orderId: isAdd ? '0' : orderData!.id.toString(),
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
        loading: locationsData
            .map((element) => element.loadingLocation.text)
            .toList(),
        loadingLat: locationsData
            .map((element) => element.loadingLocationDetails.lat.toString())
            .toList(),
        loadingLng: locationsData
            .map((element) => element.loadingLocationDetails.long.toString())
            .toList(),
        descLoading:
            locationsData.map((element) => element.loading.value).toList(),
        delivery: locationsData
            .map((element) => element.unloadingLocation.text)
            .toList(),
        deliveryLat: locationsData
            .map((element) => element.unloadingLocationDetails.lat.toString())
            .toList(),
        deliveryLng: locationsData
            .map((element) => element.unloadingLocationDetails.long.toString())
            .toList(),
        descDelivery:
            locationsData.map((element) => element.unloading.value).toList(),
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
