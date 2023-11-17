import 'package:cached_video_player/cached_video_player.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/home/data/models/statistics_model.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import 'package:khalsha/core/data/models/item_model.dart';

class HomeController extends GetxController {
  List<ItemModel> services = <ItemModel>[];

  Rx<StatisticsModel> statisticsModel = StatisticsModel().obs;

  late CachedVideoPlayerController videoController;

  RxBool showVideo = false.obs;

  @override
  void onInit() {
    videoController = CachedVideoPlayerController.network(
        'https://drive.google.com/uc?export=download&id=1SvcpuZW_-clbKU7ZFg_RRNy3QTZ31-tb')
      ..initialize().then((_) {
        showVideo(true);
      });
    services = const [
      ItemModel(
        id: 1,
        image: 'landshippings',
        text: 'الشحن البري',
        arguments: ServiceTypes.landShipping,
      ),
      ItemModel(
        id: 0,
        image: 'customsclearance',
        text: 'التخليص الجمركي',
        arguments: ServiceTypes.customsClearance,
      ),
      ItemModel(
        id: 3,
        image: 'seashippings',
        text: 'الشحن البحري',
        arguments: ServiceTypes.marineShipping,
      ),
      ItemModel(
        id: 2,
        image: 'warehouses',
        text: 'المخازن',
        arguments: ServiceTypes.stores,
      ),
      ItemModel(
        id: 5,
        image: 'laboratories',
        text: 'المختبرات و المقاييس',
        arguments: ServiceTypes.laboratoryAndStandards,
      ),
      ItemModel(
        id: 4,
        image: 'airshippings',
        text: 'الشحن الجوي',
        arguments: ServiceTypes.airFreight,
      ),
    ];
    super.onInit();
  }
}
