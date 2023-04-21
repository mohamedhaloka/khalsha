import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/domain/use_cases/upload_image_use_case.dart';
import 'package:khalsha/features/order_details/domain/use_cases/get_order_details_use_case.dart';
import 'package:khalsha/features/order_details/domain/use_cases/update_order_status_use_case.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../../../../core/domain/use_cases/delete_file_use_case.dart';
import '../../../../../core/utils.dart';
import '../../../../orders/domain/entities/order_model.dart';

class OrderDetailsController extends GetxController {
  final GetOrderDetailsUseCase _getOrderDetailsUseCase;
  final UpdateOrderStatusUseCase _updateOrderStatusUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final DeleteFileUseCase _deleteFileUseCase;
  OrderDetailsController(
    this._getOrderDetailsUseCase,
    this._updateOrderStatusUseCase,
    this._uploadImageUseCase,
    this._deleteFileUseCase,
  );

  int orderId = Get.arguments[0];
  ServiceTypes serviceType = Get.arguments[1];

  RxInt currentTab = 0.obs;
  PageController pageViewController = PageController();

  RxBool loading = true.obs;

  late OrderModel orderModel;

  @override
  void onInit() {
    getOrderDetails();
    super.onInit();
  }

  void goToParticularPage(int id) => pageViewController.animateToPage(
        id,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

  Future<void> getOrderDetails() async {
    final params = GetOrderDetailsUseCaseParams(
      loading: loading,
      type: serviceType.value,
      orderId: orderId,
    );
    final result = await _getOrderDetailsUseCase.execute(params);
    result.fold((_) => _, (r) {
      orderModel = r;
      currentTab(0);
    });
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
      (l) => showAlertMessage(l.statusMessage),
      (r) => showAlertMessage(r),
    );
  }

  Future<void> uploadImages({
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
        (r) => showAlertMessage(r),
      );
    }
  }

  Future<void> deleteImage(int imageId) async {
    final params = DeleteFileUseCaseParams(
        loading: false.obs,
        pageName: '${ServiceTypes.customsClearance.value}/step',
        id: imageId);
    final result = await _deleteFileUseCase.execute(params);
    result.fold(
      (l) => showAlertMessage(l.statusMessage),
      (r) {
        showAlertMessage(r);
        getOrderDetails();
      },
    );
  }
}
