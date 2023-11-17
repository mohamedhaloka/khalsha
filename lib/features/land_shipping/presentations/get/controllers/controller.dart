part of '../../../land_shipping.dart';

class AddEditLandShippingServiceController extends GetxController {
  final GetParticularEnvDataUseCase _getParticularEnvDataUseCase;
  final AddLandShippingUseCase _addLandShippingUseCase;
  final UpdateLandShippingUseCase _updateLandShippingUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final DownloadFileUseCase _downloadFileUseCase;
  final DeleteFileUseCase _deleteFileUseCase;
  final GetOrderDetailsUseCase _getOrderDetailsUseCase;

  AddEditLandShippingServiceController(
    this._getParticularEnvDataUseCase,
    this._addLandShippingUseCase,
    this._updateLandShippingUseCase,
    this._downloadFileUseCase,
    this._uploadImageUseCase,
    this._deleteFileUseCase,
    this._getOrderDetailsUseCase,
  );

  RxBool isInternationalShipping =
      (Get.arguments['isInternationalShipping'] as bool).obs;
  final OrderModel? orderData = (Get.arguments['orderData'] as OrderModel?);

  final formKey = GlobalKey<FormBuilderState>();

  List<Widget> children = [
    const _FillData(),
    const _AdditionalServices(),
    const _PickLocations(),
    const ConfirmOrderStepView(),
    const OrderSendSuccessfullyStepView(),
  ];

  bool get isAdd => orderData == null;

  RxInt currentStep = 0.obs;

  PageController pageController = PageController();

  String? get nextTitle => currentStep.value == children.length - 1
      ? (isAdd ? 'إرسال الطلب' : 'تعديل')
      : null;

  RxBool loading = false.obs;

  String get pageTitle {
    switch (currentStep.value) {
      case 0:
        return 'تعبئة الطلب';
      case 1:
        return 'الخدمات الإضافية';
      case 2:
        return 'تحديد الموقع';
      case 3:
        return 'رفع الملفات';
      case 4:
        return 'تأكيد الطلب';
      case 5:
        return 'إرسال الطلب';
    }
    return '';
  }

  bool get isPrivateTransfer => goodsType.value == 1;

  TextEditingController name = TextEditingController(),
      content = TextEditingController();

  RxList<DataModel> countries = <DataModel>[].obs,
      trucks = <DataModel>[].obs,
      shipmentTypes = <DataModel>[].obs;

  RxList<FileModel> files = <FileModel>[].obs;

  RxInt shippingType = 0.obs;
  RxInt goodsType = 0.obs;

  Rx<DataModel> fromCountry = DataModel.initial().obs,
      toCountry = DataModel.initial().obs,
      truck = DataModel.initial().obs,
      shipmentType = DataModel.initial().obs;

  RxList<BundledGoodsModel> bundledGoodsItems = <BundledGoodsModel>[
    BundledGoodsModel.newItem(),
  ].obs;

  RxInt storageDays = 0.obs;
  RxBool hasFlammable = false.obs;
  RxString workersType = ''.obs;

  DateTime loadingDate = DateTime.now(), deliveryDate = DateTime.now();

  TextEditingController recipientName = TextEditingController(),
      note = TextEditingController(),
      recipientMobile = TextEditingController();

  RxList<LandShippingServiceModel> serviceData = [
    LandShippingServiceModel.newItem(),
  ].obs;

  RxList<LoadingUnLoadingLocationsModel> locationsData = [
    LoadingUnLoadingLocationsModel.newItem(),
  ].obs;

  List<int> deletedFilesIds = <int>[];
  List<String> newFilesPath = <String>[];

  @override
  void onInit() {
    _fillData();
    super.onInit();
  }

  void _fillData() async {
    loading(true);
    shippingType(getValue('shippingType', defaultValue: 0));
    goodsType(getValue('goodsType', defaultValue: 1));
    if (goodsType.value != 0) {
      children.insert(3, const LandShippingAttachFilesStepView());
    }
    _getData('countries', onSuccess: (data) => countries.addAll(data));
    _getData('shipmenttypes', onSuccess: (data) => shipmentTypes.addAll(data));
    _getData('trucks', onSuccess: (data) => trucks.addAll(data));
    if (orderData == null) {
      loading(false);
      return;
    }

    final params = GetOrderDetailsUseCaseParams(
      loading: loading,
      type: ServiceTypes.landShipping.value,
      orderId: orderData!.id,
    );
    final result = await _getOrderDetailsUseCase.execute(params);
    result.fold(
      (_) => _,
      (landShippingOrder) async {
        final order = landShippingOrder as LandShippingOrder;
        name.text = order.title;
        fromCountry(order.fromCountry);
        toCountry(order.toCountry);
        goodsType(order.goodsTypeId);
        content.text = order.content;
        note.text = order.note ?? '';
        truck(order.truck);
        shipmentType(order.shipmentType);

        if (!isInternationalShipping.value) {
          storageDays(order.storageDays);
        }

        if (isPrivateTransfer) {
          workersType(order.workers);
          bundledGoodsItems.clear();
          if (order.extraServices.isNotEmpty) {
            serviceData.clear();
          }
          for (var service in order.extraServices) {
            serviceData.add(
              LandShippingServiceModel(
                item: TextEditingController(text: service.name),
                quantity:
                    TextEditingController(text: service.quantity.toString()),
                packaging: (service.packaging == 'yes' ? true : false).obs,
                pack: (service.pack == 'yes' ? true : false).obs,
                unpack: (service.unpack == 'yes' ? true : false).obs,
              ),
            );
          }
        } else {
          serviceData.clear();
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
        }

        hasFlammable(order.flammable == 'yes' ? true : false);

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

        loadingDate = order.loadingDate;
        deliveryDate = order.deliveryDate;
        recipientName.text = order.recipientName;
        recipientMobile.text = order.recipientMobile;

        for (var file in order.files ?? <OrderFile>[]) {
          await _downloadFile(
            file.url!,
            onSuccess: (filePath) => files.add(
              FileModel(
                id: file.id,
                file: File(filePath),
                type: file.mimtype!,
              ),
            ),
          );
        }
        loading(false);
      },
    );
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
        wantStorage: isInternationalShipping.value
            ? 'no'
            : storageDays.value > 0
                ? 'yes'
                : 'no',
        content: content.text,
        note: note.text,
        title: name.text,
        shipmentTypeId: shipmentType.value.id.toString(),
        fromCountryId: fromCountry.value.id.toString(),
        toCountryId: toCountry.value.id.toString(),
        storageDays: isInternationalShipping.value ? '0' : storageDays.string,
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
        await _uploadImages(
          data['orderId'].toString(),
          listLength: files.length,
          item: (int index) => files[index].file.path,
        );
        showAlertMessage('تم إرسال الطلب');
        Get.offAllNamed(Routes.root);
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
        await _uploadImages(
          data['orderId'].toString(),
          listLength: newFilesPath.length,
          item: (int index) => newFilesPath[index],
        );
        await _deleteRemovedFiles();
        showAlertMessage(data['message']);
      },
    );
  }

  Future<void> _uploadImages(
    String orderId, {
    required int listLength,
    required String Function(int index) item,
  }) async {
    for (int i = 0; i < listLength; i++) {
      final params = UploadImageUseCaseParams(
        loading: loading,
        pageName: 'landshippings',
        path: 'landshipping',
        orderId: orderId,
        field: 'landshipping_file',
        filePath: item(i),
      );

      await _uploadImageUseCase.execute(params);
    }
  }

  Future<void> _deleteRemovedFiles() async {
    for (var deletedFileId in deletedFilesIds) {
      final params = DeleteFileUseCaseParams(
        loading: loading,
        pageName: 'landshippings',
        id: deletedFileId,
      );
      await _deleteFileUseCase.execute(params);
    }
    Get.back(result: true);
  }
}
