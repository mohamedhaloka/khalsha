part of '../../view.dart';

class OrderDetailsController extends GetxController {
  final GetOrderDetailsUseCase _getOrderDetailsUseCase;
  final UpdateOrderStatusUseCase _updateOrderStatusUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final DeleteFileUseCase _deleteFileUseCase;
  final AcceptRejectOfferUseCase _acceptRejectOfferUseCase;
  final RateOrderUseCase _rateOrderUseCase;
  OrderDetailsController(
    this._getOrderDetailsUseCase,
    this._updateOrderStatusUseCase,
    this._uploadImageUseCase,
    this._deleteFileUseCase,
    this._acceptRejectOfferUseCase,
    this._rateOrderUseCase,
  );

  int orderId = Get.arguments['orderId'];
  ServiceTypes serviceType = Get.arguments['serviceType'];
  bool fromBill = Get.arguments['isBill'];

  RxInt currentTab = 0.obs;
  PageController pageViewController = PageController();

  RxBool loading = true.obs,
      offerActionLoading = false.obs,
      rateOrderLoading = false.obs,
      showInvoiceLoading = false.obs;

  late OrderModel orderModel;

  List<ItemModel> pages = [
    const ItemModel(
      id: 0,
      text: '',
      image: 'data',
      child: _OrderDataTab(),
    ),
    const ItemModel(
      id: 1,
      text: '',
      image: 'pricing-offers',
      child: _PricingOffersTab(),
    ),
    const ItemModel(
      id: 2,
      text: '',
      image: 'track',
      child: _StatusData(),
    ),
    const ItemModel(
      id: 3,
      text: '',
      image: 'bill',
      child: _BillDataTab(),
    ),
  ];

  @override
  void onInit() {
    getOrderDetails();
    super.onInit();
  }

  void goToParticularPage(int index) => pageViewController.jumpToPage(index);

  Future<void> getOrderDetails() async {
    final params = GetOrderDetailsUseCaseParams(
      loading: loading,
      type: serviceType.value,
      orderId: orderId,
    );
    final result = await _getOrderDetailsUseCase.execute(params);
    result.fold(
      (_) => _,
      _onGetOrderDetailsSuccess,
    );
  }

  void _onGetOrderDetailsSuccess(OrderModel orderData) async {
    orderModel = orderData;
    currentTab(0);

    if (orderModel.offer != null || orderModel.invoice != null) {
      pages.removeWhere((element) => element.id == 1);
    }

    if (serviceType != ServiceTypes.customsClearance) {
      pages.removeWhere((element) => element.id == 2);
    }

    await Future.delayed(const Duration(milliseconds: 300));
    if (fromBill) {
      int indexOfLaseTab =
          pages.indexWhere((element) => element.id == pages.last.id);
      goToParticularPage(indexOfLaseTab);
    }
  }

  Future<void> updateOrderStatus({
    required String comment,
    required String status,
    required int statusId,
  }) async {
    final params = UpdateOrderStatusUseCaseParams(
      loading: false.obs,
      type: ServiceTypes.customsClearance.value,
      statusId: statusId,
      status: status,
      comment: comment,
    );
    final result = await _updateOrderStatusUseCase.execute(params);
    result.fold(
      (l) => util.showAlertMessage(l.statusMessage),
      (r) => util.showAlertMessage(r),
    );
  }

  Future<void> uploadStepImages({
    required int statusId,
    required List<File> images,
  }) async {
    for (var image in images) {
      final params = UploadImageUseCaseParams(
        loading: false.obs,
        pageName: '${ServiceTypes.customsClearance.value}/step',
        path: 'customclearancestep${orderModel.id}',
        orderId: statusId.toString(),
        field: 'customclearancestep_file',
        filePath: image.path,
      );
      final result = await _uploadImageUseCase.execute(params);
      result.fold(
        (_) => _,
        (r) => util.showAlertMessage(r),
      );
    }
  }

  Future<void> showFileChooseDialog(String filePath) => util.showDialog(
        'تم إختيار الملف',
        doneText: 'رفع الملف',
        onDoneTapped: () => _uploadOrderFiles(filePath),
      );

  Future<void> _uploadOrderFiles(String filePath) async {
    final params = UploadImageUseCaseParams(
      loading: false.obs,
      pageName: 'customsclearance',
      path: 'customclearancestep',
      orderId: orderId.toString(),
      field: 'customclearancestep_file',
      filePath: filePath,
    );

    final result = await _uploadImageUseCase.execute(params);
    result.fold(
      (failure) => util.showAlertMessage(failure.statusMessage),
      (successMsg) {
        util.showAlertMessage(successMsg);
        getOrderDetails();
      },
    );
    Get.back();
  }

  Future<void> deleteImage(int imageId) async {
    final params = DeleteFileUseCaseParams(
        loading: false.obs,
        pageName: '${ServiceTypes.customsClearance.value}/step',
        id: imageId);
    final result = await _deleteFileUseCase.execute(params);
    result.fold(
      (l) => util.showAlertMessage(l.statusMessage),
      (r) {
        util.showAlertMessage(r);
        getOrderDetails();
      },
    );
  }

  Future<void> acceptOrReject(
    String status, {
    required int? offerId,
  }) async {
    final params = AcceptRejectOfferUseCaseParams(
      loading: offerActionLoading,
      type: serviceType.value,
      status: status,
      orderId: offerId.toString(),
    );
    final result = await _acceptRejectOfferUseCase.execute(params);
    result.fold(
      (_) => _,
      (msg) {
        util.showAlertMessage(msg);
        Get.back();
        getOrderDetails();
      },
    );
  }

  Future<void> rateOrder({
    required double rate,
    required String feedback,
  }) async {
    final modulesList = [
      "CustomClearance",
      "LandShipping",
      "Warehouse",
      "SeaShipping",
      "AirShipping",
      "Laboratory",
    ];
    final params = RateOrderUseCaseParams(
      loading: rateOrderLoading,
      rate: rate,
      feedback: feedback,
      module: modulesList[serviceType.index],
      orderId: orderId.toString(),
    );
    final result = await _rateOrderUseCase.execute(params);
    result.fold((failure) => util.showAlertMessage(failure.statusMessage), (_) {
      util.showAlertMessage('تم تقييم الطلب بنجاح');
      Get.back();
      getOrderDetails();
    });
  }

  Future<void> showInvoice(String url) async {
    showInvoiceLoading(true);
    var tempDir = await getTemporaryDirectory();
    String fullPath = '${tempDir.path}/invoice_${url.split('/').last}.pdf';

    final response = await http.get(
      Uri.parse(url),
      headers: HttpService.header,
    );

    File pdfFile = await File(fullPath).writeAsBytes(response.bodyBytes);
    Get.to(InvoiceDetailsView(path: pdfFile.path));
    showInvoiceLoading(false);
  }
}
