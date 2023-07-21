import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';

import '../../../../../core/utils.dart';
import '../../../domain/use_cases/reset_password_use_case.dart';

class ResetPasswordController extends GetxController {
  final ResetPasswordUseCase _resetPasswordUseCase;
  ResetPasswordController(this._resetPasswordUseCase);

  final String account = Get.arguments;

  TextEditingController code = TextEditingController(),
      password = TextEditingController(),
      confirmationPassword = TextEditingController();

  RxBool loading = false.obs;

  bool get isUserTypeEmail => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(account);

  Future<void> resetPassword() async {
    if (_anyInputsIsEmpty) {
      showAlertMessage('جميع الحقول مطلوبة');
      return;
    }
    if (_passwordsIsNotEqual) {
      showAlertMessage('يجب ان يتساوا كلمتا المرور');
      return;
    }
    final params = ResetPasswordParams(
      loading: loading,
      account: account.toString(),
      code: code.text,
      password: password.text,
      confirmationPassword: confirmationPassword.text,
    );
    final result = await _resetPasswordUseCase.execute(params);
    result.fold(
      (Failure failure) => showAlertMessage(failure.statusMessage),
      (String successMsg) {
        showAlertMessage(successMsg);
        Get.offAllNamed(Routes.login);
      },
    );
  }

  bool get _anyInputsIsEmpty =>
      code.text.isEmpty || password.text.isEmpty || password.text.isEmpty;

  bool get _passwordsIsNotEqual => password.text != confirmationPassword.text;
}
