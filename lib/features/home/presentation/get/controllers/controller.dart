import 'package:get/get.dart';
import 'package:khalsha/core/models/item_model.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

class HomeController extends GetxController {
  List<ItemModel> services = <ItemModel>[];

  @override
  void onInit() {
    services = const [
      ItemModel(
        id: 0,
        image: 'customs-clearance',
        text: 'التخليص الجمركي',
        arguments: ServiceType.customsClearance,
      ),
      ItemModel(
        id: 1,
        image: 'land-shipping',
        text: 'الشحن البري',
        arguments: ServiceType.landShipping,
      ),
      ItemModel(
        id: 2,
        image: 'stores',
        text: 'المخازن',
        arguments: ServiceType.stores,
      ),
      ItemModel(
        id: 3,
        image: 'marine-shipping',
        text: 'الشحن البحري',
        arguments: ServiceType.marineShipping,
      ),
      ItemModel(
        id: 4,
        image: 'air-freight',
        text: 'الشحن الجوي',
        arguments: ServiceType.airFreight,
      ),
      ItemModel(
        id: 5,
        image: 'laboratory-and-standards',
        text: 'المختبرات و المقاييس',
        arguments: ServiceType.laboratoryAndStandards,
      ),
    ];
    super.onInit();
  }
}
