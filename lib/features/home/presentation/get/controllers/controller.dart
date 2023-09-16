import 'package:get/get.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/home/data/models/statistics_model.dart';
import 'package:khalsha/features/home/domain/use_cases/get_statistics_use_case.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/data/models/item_model.dart';
import '../../../../../core/utils.dart';

class HomeController extends GetxController {
  final GetStatisticsUseCase _getStatisticsUseCase;
  HomeController(this._getStatisticsUseCase);

  List<ItemModel> services = <ItemModel>[];

  Rx<StatisticsModel> statisticsModel = StatisticsModel().obs;

  late VideoPlayerController videoController;

  RxBool showVideo = false.obs;

  @override
  void onInit() {
    videoController =
        VideoPlayerController.asset('assets/videos/khalsha-motion-video.mp4')
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
    // _getStatistics();
    super.onInit();
  }

  Future<void> _getStatistics() async {
    final params = Params(
      loading: false.obs,
    );
    final result = await _getStatisticsUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) => statisticsModel(data),
    );
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}
