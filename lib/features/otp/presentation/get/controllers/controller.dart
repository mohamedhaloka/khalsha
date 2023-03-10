import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  TextEditingController code = TextEditingController();

  RxInt timer = 0.obs;

  @override
  void onInit() async {
    resendCode();
    super.onInit();
  }

  void resendCode() {
    _resetTimer();
  }

  void _resetTimer() =>
      timer.value = DateTime.now().millisecondsSinceEpoch + 1000 * 60;
}
