import 'package:get/get.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:share_plus/share_plus.dart';

class ShareAppController extends GetxController {
  @override
  void onReady() {
    Future.delayed(
      const Duration(seconds: 1),
      () => Share.share(HttpService.websiteURL),
    );

    super.onReady();
  }
}
