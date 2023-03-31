import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/features/forget_password/domain/use_cases/forget_password_use_case.dart';

import '../../../../../core/utils.dart';

class ForgetPasswordController extends GetxController {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  ForgetPasswordController(this._forgetPasswordUseCase);

  TextEditingController account = TextEditingController();

  RxBool loading = false.obs;

  Future<void> resetAccount() async {
    final params = ForgetPasswordParams(
      loading: loading,
      account: account.text,
    );
    final result = await _forgetPasswordUseCase.execute(params);
    result.fold(
      (Failure failure) => showAlertMessage(failure.statusMessage),
      (String successMsg) {
        showAlertMessage(successMsg);
        Get.toNamed(
          Routes.resetPassword,
          arguments: account.text,
        );
      },
    );
  }
}
