import 'package:get/get.dart';
import 'package:khalsha/core/models/item_model.dart';

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
}

enum ServiceType {
  customsClearance('customs-clearance'),
  landShipping('land-shipping'),
  stores('stores'),
  marineShipping('marine-shipping'),
  airFreight('air-freight'),
  laboratoryAndStandards('laboratory-and-standards');

  const ServiceType(this.value);
  final String value;
}
