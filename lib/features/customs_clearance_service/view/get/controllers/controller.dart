import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/domain/use_cases/get_particular_env_data_use_case.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/utils.dart';
import 'package:khalsha/features/customs_clearance_service/data/models/customs_clearance_data.dart';

import '../../../../../../../core/data/models/data_model.dart';
import '../../../domain/use_cases/add_customs_clearance_use_case.dart';
import '../models/container_data_model.dart';
import '../models/parcel_data_model.dart';

class AddEditCustomsClearanceController extends GetxController {
  final GetParticularEnvDataUseCase _getParticularEnvDataUseCase;
  final AddCustomsClearanceUseCase _addCustomsClearanceUseCase;
  AddEditCustomsClearanceController(
    this._getParticularEnvDataUseCase,
    this._addCustomsClearanceUseCase,
  );

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
    if (currentStep.value == 3) return 'اطلب';
    return 'التالي';
  }

  RxInt selectedShippingField = 0.obs;

  RxInt selectedShippingType = 0.obs;

  Rx<DataModel> selectedShippingPort = DataModel.empty().obs;
  List<DataModel> shippingPorts = <DataModel>[];

  RxString selectedGoodType = ''.obs;
  List<DataModel> goodsTypes = <DataModel>[];

  RxInt selectedShippingMethod = (-1).obs;
  RxInt numberOfStorage = 0.obs;

  RxList<TextEditingController> customsClauseList =
      <TextEditingController>[].obs;

  TextEditingController name = TextEditingController(),
      deliverTo = TextEditingController(),
      description = TextEditingController(),
      total = TextEditingController();

  RxString selectedCurrency = ''.obs;

  RxList<ParcelDataModel> parcel = <ParcelDataModel>[].obs;
  RxList<ContainerDataModel> container = <ContainerDataModel>[].obs;

  Rx<File> commercialInvoice = File('').obs,
      certificateOfOrigin = File('').obs,
      packingList = File('').obs,
      billOfLading = File('').obs;

  RxBool loading = false.obs;

  @override
  void onInit() {
    _getData('shippingports', onSuccess: (data) => shippingPorts.addAll(data));
    _getData('goodstypes', onSuccess: (data) => goodsTypes.addAll(data));
    super.onInit();
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

  void onTapNext() {
    if (currentStep.value == 3) {
      createOrder();
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
        return commercialInvoice.value.path == '' ||
            packingList.value.path == '' ||
            certificateOfOrigin.value.path == '' ||
            billOfLading.value.path == '';
    }
    return false;
  }

  CustomsClearanceData get _customsClearanceData => CustomsClearanceData(
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
        notes: '',
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
        shipmentType: selectedShippingType.value == 0 ? 'import' : 'export',
        shippingPortId: selectedShippingPort.value.id.toString(),
        storageDays: numberOfStorage.string,
        wantStorage: numberOfStorage.value > 0 ? 'yes' : 'no',
      );

  Future<void> createOrder() async {
    final params = AddCustomsClearanceUseCaseParams(
      loading: loading,
      customsClearanceData: _customsClearanceData,
    );
    final result = await _addCustomsClearanceUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (successMsg) {
        showAlertMessage(successMsg);
        Get.offAllNamed(Routes.root);
      },
    );
  }
}
