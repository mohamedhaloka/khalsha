import 'package:get/get.dart';

import '../../../../../core/data/models/item_model.dart';
import '../../../../../core/presentation/routes/app_routes.dart';

class ServiceIntroController extends GetxController {
  ServiceType serviceType = Get.arguments;

  List<ItemModel> options = const <ItemModel>[
    ItemModel(
      image: 'supplier',
      text: 'أكثر من 1000 مزود خدمة',
    ),
    ItemModel(
      image: 'star',
      text: '4.8 متوسط تقييمات خدمتنا',
    ),
    ItemModel(
      image: 'prices-offer',
      text: 'احصل على عروض أسعار',
    ),
    ItemModel(
      image: 'users',
      text: 'أكثر من 1000 عميل يثق بنا',
    ),
  ];

  String get routeNamed {
    switch (serviceType) {
      case ServiceType.customsClearance:
        return Routes.customsClearanceService;
      case ServiceType.landShipping:
        return Routes.chooseShippingService;
      case ServiceType.stores:
        return Routes.stores;
      case ServiceType.marineShipping:
        return Routes.marineShipping;
      case ServiceType.airFreight:
        return Routes.airFreight;
      case ServiceType.laboratoryAndStandards:
        return Routes.laboratoryAndStandardsService;
    }
  }
}

enum ServiceType {
  customsClearance('customsclearance'),
  landShipping('landshippings'),
  stores('warehouses'),
  marineShipping('seashippings'),
  airFreight('airshippings'),
  laboratoryAndStandards('laboratories');

  const ServiceType(this.value);
  final String value;
}
