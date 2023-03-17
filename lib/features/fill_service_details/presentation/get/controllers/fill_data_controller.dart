import 'package:get/get.dart';
import 'package:khalsha/core/models/item_model.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/fill_service_details_controller.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

class FillDataController extends GetxController {
  final _fillServiceDetailsController =
      Get.find<FillServiceDetailsController>();
  ServiceType get serviceType => _fillServiceDetailsController.serviceType;

  RxInt selectedShippingField = 0.obs;
  List<ItemModel> shippingFieldOptions = const <ItemModel>[
    ItemModel(
      text: 'شخصية',
      id: 0,
    ),
    ItemModel(
      text: 'تجارية',
      id: 1,
    )
  ];

  RxInt selectedShippingType = 0.obs;
  List<ItemModel> shippingTypeOptions = const <ItemModel>[
    ItemModel(
      text: 'إستيراد',
      id: 0,
    ),
    ItemModel(
      text: 'تصدير',
      id: 1,
    )
  ];

  Rx<ItemModel> selectedShippingPlace = ItemModel.empty().obs;
  List<ItemModel> shippingPlacesOptions = const <ItemModel>[
    ItemModel(
      text: 'ميناء 1',
      id: 0,
    ),
    ItemModel(
      text: 'ميناء 2',
      id: 1,
    ),
    ItemModel(
      text: 'ميناء 3',
      id: 2,
    ),
    ItemModel(
      text: 'ميناء 4',
      id: 3,
    ),
    ItemModel(
      text: 'ميناء 5',
      id: 4,
    ),
    ItemModel(
      text: 'ميناء 6',
      id: 5,
    ),
    ItemModel(
      text: 'ميناء 7',
      id: 6,
    ),
    ItemModel(
      text: 'ميناء 8',
      id: 7,
    ),
    ItemModel(
      text: 'ميناء 9',
      id: 8,
    ),
    ItemModel(
      text: 'ميناء 10',
      id: 9,
    ),
  ];

  RxInt selectedShipType = 0.obs;
  List<ItemModel> shipTypeOptions = const <ItemModel>[
    ItemModel(
      text: 'طرد',
      id: 0,
    ),
    ItemModel(
      text: 'حاوية',
      id: 1,
    )
  ];
}
