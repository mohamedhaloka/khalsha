import 'package:get/get.dart';
import 'package:khalsha/core/models/item_model.dart';
import 'package:khalsha/features/fill_service_details/domain/entities/package_model.dart';
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

  RxList<PackageModel> packages = <PackageModel>[
    PackageModel.newItem(),
  ].obs;

  void addNewPackageItem() => packages.add(PackageModel.newItem());
}

List<ItemModel> testItemsList = const <ItemModel>[
  ItemModel(
    text: '1',
    id: 0,
  ),
  ItemModel(
    text: '2',
    id: 1,
  ),
  ItemModel(
    text: '3',
    id: 2,
  ),
  ItemModel(
    text: '4',
    id: 3,
  ),
  ItemModel(
    text: '5',
    id: 4,
  ),
  ItemModel(
    text: '6',
    id: 5,
  ),
  ItemModel(
    text: '7',
    id: 6,
  ),
  ItemModel(
    text: '8',
    id: 7,
  ),
  ItemModel(
    text: '9',
    id: 8,
  ),
  ItemModel(
    text: '10',
    id: 9,
  ),
];
