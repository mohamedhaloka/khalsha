import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/register/domain/use_cases/register_use_case.dart';

import '../../../../../core/data/local_storage/user_local.dart';
import '../../../../../core/data/models/item_model.dart';
import '../../../../../core/data/models/user_data_model.dart';
import '../../../../../core/domain/error/failures.dart';
import '../../../../../core/presentation/routes/app_routes.dart';
import '../../../../../core/utils.dart';

class RegisterController extends GetxController {
  final RegisterUseCase _registerUseCase;
  RegisterController(this._registerUseCase);

  List<ItemModel> tabs = const <ItemModel>[
    ItemModel(text: 'مستورد/مصدر', id: 0),
    ItemModel(text: 'مقدم خدمات لوجيستية', id: 1),
  ];

  List<ItemModel> socials = const <ItemModel>[
    ItemModel(text: 'Apple', image: 'apple'),
    ItemModel(text: 'Google', image: 'google'),
    ItemModel(text: 'Facebook', image: 'facebook'),
  ];

  RxInt currentTab = 0.obs;
  RxBool loading = false.obs,
      passSecure = true.obs,
      passConfirmationSecure = true.obs;

  Rx<File> commercialRegisterFile = File('').obs;

  TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController(),
      passwordConfirmation = TextEditingController(),
      phone = TextEditingController();

  String get userType {
    if (currentTab.value == 0) return UserType.importerExporter.value;
    return UserType.provider.value;
  }

  Future<void> register() async {
    if (_anyInputsIsEmpty) {
      showAlertMessage('جميع الحقول مطلوبة');
      return;
    }
    if (_passwordsIsNotEqual) {
      showAlertMessage('يجب ان يتساوا كلمتا المرور');
      return;
    }
    if (_notChooseCommercialCertificateInImporterExporter) {
      showAlertMessage('يجب إضافة ملف السجل التجاري');
      return;
    }
    final params = RegisterParams(
      loading: loading,
      name: name.text,
      email: email.text,
      passwordConfirmation: passwordConfirmation.text,
      password: password.text,
      userType: userType,
      phone: phone.text,
      commercialCertificate: commercialRegisterFile.value.path,
    );

    final result = await _registerUseCase.execute(params);
    result.fold(
      (Failure failure) => showAlertMessage(failure.statusMessage),
      (UserData userData) {
        UserDataLocal.instance.setToken(userData.accessToken ?? '');
        Get.toNamed(
          Routes.otp,
          arguments: userData.toJson(),
        );
      },
    );
  }

  bool get _anyInputsIsEmpty =>
      name.text.isEmpty ||
      email.text.isEmpty ||
      password.text.isEmpty ||
      passwordConfirmation.text.isEmpty ||
      phone.text.isEmpty;

  bool get _passwordsIsNotEqual => password.text != passwordConfirmation.text;

  bool get _notChooseCommercialCertificateInImporterExporter =>
      userType == UserType.importerExporter.value &&
      commercialRegisterFile.value.path.isEmpty;
}
