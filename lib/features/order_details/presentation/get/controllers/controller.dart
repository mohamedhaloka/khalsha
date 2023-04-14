import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/order_details/data/models/order_section_model.dart';
import 'package:khalsha/features/order_details/domain/use_cases/get_order_details_use_case.dart';
import 'package:khalsha/features/orders/data/models/order_model.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../../../../core/data/models/item_model.dart';

class OrderDetailsController extends GetxController {
  final GetOrderDetailsUseCase _getOrderDetailsUseCase;
  OrderDetailsController(this._getOrderDetailsUseCase);

  int orderId = Get.arguments;

  RxInt currentTab = 0.obs;
  PageController pageViewController = PageController();

  RxInt currentStatus = 1.obs;
  PageController statusSliderController = PageController(initialPage: 1);

  List<OrderSectionModel> orderSections = <OrderSectionModel>[];

  RxBool loading = true.obs;

  OrderModel orderModel = OrderModel.empty();

  List<ItemModel> status = const <ItemModel>[
    ItemModel(
      id: 0,
      statusId: 0,
      text: 'استلام الاوراق',
      image: 'receipt-of-papers',
    ),
    ItemModel(
      id: 1,
      statusId: 1,
      text: 'استلام التفويض',
      image: 'receipt-of-authorization',
    ),
    ItemModel(
      id: 2,
      statusId: 2,
      text: 'تحضير الاوراق',
      image: 'paper-preparation',
    ),
    ItemModel(
      id: 3,
      statusId: 2,
      text: 'استلام الشحنة',
      image: 'receive-the-shipment',
    ),
  ];

  @override
  void onInit() {
    _getOrderDetails();

    super.onInit();
  }

  void goToParticularPage(int id) => pageViewController.animateToPage(
        id,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

  void goToStatus() => statusSliderController.animateToPage(
        currentStatus.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

  Future<void> _getOrderDetails() async {
    final params = GetOrderDetailsUseCaseParams(
      loading: loading,
      type: ServiceType.customsClearance.value,
      orderId: orderId,
    );
    final result = await _getOrderDetailsUseCase.execute(params);
    result.fold((_) => _, (r) {
      orderModel = r;
      _fillData();
    });
  }

  void _fillData() {
    orderSections = [
      OrderSectionModel(
        title: 'معلومات الطلب',
        data: [
          ItemModel(text: 'عنوان الطلب', description: orderModel.title),
          ItemModel(text: 'وصف البضاعة', description: orderModel.content),
          ItemModel(
              text: 'منفذ الشحنة', description: orderModel.shippingport.name),
          ItemModel(text: 'نوع الشحنة', description: orderModel.shipmentType),
          ItemModel(text: 'الإجمالي', description: orderModel.total),
          ItemModel(text: 'نوع الشحن', description: orderModel.shippingMethod),
          ItemModel(text: 'توصيل إلي', description: orderModel.deliveryTo),
          ItemModel(text: 'مجال الشحنة', description: orderModel.chargeField),
          ItemModel(
              text: 'هل يوجد بند جمزكي', description: orderModel.customsItem),
          for (var item in orderModel.items) ...[
            ItemModel(text: 'رقم البند الجمركي', description: item.name),
          ]
        ],
      ),
      OrderSectionModel(
        title: 'طرد',
        data: [
          for (var item in orderModel.shippingmethods) ...[
            ItemModel(text: 'نوع البضاعة', description: item.parcelType),
            ItemModel(text: 'نوع الطرد', description: item.parcelType),
            ItemModel(
                text: 'إجمالي الحجم (متر مكعب)', description: item.totalSize),
            ItemModel(
                text: 'إجمالي الوزن (كيلوجرام)', description: item.totalWeight),
            ItemModel(text: 'الكمية', description: item.quantity),
          ]
        ],
      ),
      OrderSectionModel(
        title: 'خدمات إضافية',
        data: [
          ItemModel(
              text: 'هل تريد التخزين',
              description: orderModel.storageDaysNumber > 0 ? 'yes' : 'no'),
          ItemModel(
              text: 'عدد أيام التخزين', description: orderModel.storageDays),
        ],
      ),
    ];
  }
}
