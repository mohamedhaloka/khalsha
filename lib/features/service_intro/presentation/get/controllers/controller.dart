import 'package:get/get.dart';

import '../../../../../core/data/models/item_model.dart';
import '../../../../../core/presentation/routes/app_routes.dart';

class ServiceIntroController extends GetxController {
  ServiceTypes serviceType = Get.arguments;

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
      case ServiceTypes.customsClearance:
        return Routes.customsClearanceService;
      case ServiceTypes.landShipping:
        return Routes.chooseShippingService;
      case ServiceTypes.stores:
        return Routes.stores;
      case ServiceTypes.marineShipping:
        return Routes.marineShipping;
      case ServiceTypes.airFreight:
        return Routes.airFreight;
      case ServiceTypes.laboratoryAndStandards:
        return Routes.laboratoryAndStandardsService;
    }
  }
}

enum ServiceTypes {
  customsClearance('customsclearance'),
  landShipping('landshippings'),
  stores('warehouses'),
  marineShipping('seashippings'),
  airFreight('airshippings'),
  laboratoryAndStandards('laboratories');

  const ServiceTypes(this.value);
  final String value;
}
