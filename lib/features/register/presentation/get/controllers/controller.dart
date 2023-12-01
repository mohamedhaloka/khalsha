import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/item_model.dart';
import 'package:khalsha/core/data/models/user_data_model.dart';
import 'package:khalsha/core/data/source/local/user_local.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/utils.dart';
import 'package:khalsha/features/otp/domain/entites/enums/verify_type.dart';
import 'package:khalsha/features/otp/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/register/domain/use_cases/register_use_case.dart';

class RegisterController extends GetxController {
  final RegisterUseCase _registerUseCase;
  RegisterController(this._registerUseCase);

  List<ItemModel> tabs = const <ItemModel>[
    ItemModel(text: 'أفراد/شركات', id: 0),
    ItemModel(text: 'مقدم خدمات لوجيستية', id: 1),
  ];

  RxInt currentTab = 0.obs;
  RxBool loading = false.obs,
      passSecure = true.obs,
      passConfirmationSecure = true.obs;

  TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      password = TextEditingController(),
      passwordConfirmation = TextEditingController(),
      phone = TextEditingController();

  Future<void> register() async {
    if (_anyInputsIsEmpty) {
      showAlertMessage('جميع الحقول مطلوبة');
      return;
    }
    if (_passwordsIsNotEqual) {
      showAlertMessage('يجب ان يتساوا كلمتا المرور');
      return;
    }
    if (_phoneIsNotValid) {
      showAlertMessage('يرجى كتابة رقم هاتف بشكل صحيح');
      return;
    }
    final params = RegisterParams(
      loading: loading,
      name: name.text,
      email: email.text,
      passwordConfirmation: passwordConfirmation.text,
      password: password.text,
      userType: UserType.importerExporter.value,
      phone: phone.text,
      commercialCertificate: '',
    );

    final result = await _registerUseCase.execute(params);
    result.fold(
      (Failure failure) => showAlertMessage(failure.statusMessage),
      (UserData userData) {
        UserDataLocal.instance.setToken(userData.accessToken ?? '');
        Get.toNamed(
          Routes.otp,
          arguments: {
            kUserData: userData.toJson(),
            kVerifyType: VerifyType.email,
            kRequestResendCode: false,
          },
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
  bool get _phoneIsNotValid =>
      !phone.text.startsWith('05') || phone.text.length != 10;
}
