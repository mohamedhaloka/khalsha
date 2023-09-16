import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/profile_data_model.dart';
import 'package:khalsha/core/data/source/local/user_local.dart';

import '../../../../../core/utils.dart';
import '../../../domain/use_cases/send_message_use_case.dart';

class ContactUsController extends GetxController {
  final SendMessageContactUsUseCase _sendMessageContactUsUseCase;
  ContactUsController(this._sendMessageContactUsUseCase);

  TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      title = TextEditingController(),
      mobile = TextEditingController(),
      message = TextEditingController();

  RxBool loading = false.obs;

  @override
  void onInit() {
    _setData();
    super.onInit();
  }

  void _setData() {
    ProfileDataModel? userData = UserDataLocal.instance.data.value.user;
    if (userData == null) return;
    name.text = userData.name ?? '';
    mobile.text = userData.mobile ?? '';
    email.text = userData.email ?? '';
  }

  void sendMessage() async {
    if (_anyInputIsEmpty) {
      showAlertMessage('جميع الحقول مطلوبة');
      return;
    }
    final params = SendMessageContactUsParams(
      loading: loading,
      email: email.text,
      mobile: mobile.text,
      name: name.text,
      message: message.text,
      title: title.text,
    );

    final result = await _sendMessageContactUsUseCase.execute(params);

    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (successMsg) {
        showAlertMessage(successMsg);
        title.clear();
        message.clear();
      },
    );
  }

  @override
  void onClose() {
    name.clear();
    mobile.clear();
    email.clear();
    title.clear();
    message.clear();
    super.onClose();
  }

  bool get _anyInputIsEmpty =>
      email.text.isEmpty ||
      mobile.text.isEmpty ||
      name.text.isEmpty ||
      message.text.isEmpty ||
      title.text.isEmpty;
}
