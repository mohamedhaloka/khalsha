import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/profile_data_model.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/get_profile_use_case.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';

import '../../../../../core/data/source/local/user_local.dart';
import '../../../../../core/presentation/routes/app_routes.dart';
import '../../../../../core/utils.dart';
import '../../../domain/use_cases/change_password_use_case.dart';

class AccountSettingsController extends GetxController {
  final GetProfileUseCase _getProfileUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  AccountSettingsController(
    this._getProfileUseCase,
    this._changePasswordUseCase,
  );

  Rx<File> commercialCertificate = File('').obs;

  TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController(),
      bio = TextEditingController(),
      oldPassword = TextEditingController(),
      newPassword = TextEditingController(),
      confirmNewPassword = TextEditingController();

  RxBool loading = false.obs;
  RxBool changePasswordLoading = false.obs;

  @override
  void onInit() {
    _getProfileData();
    super.onInit();
  }

  Future<void> _getProfileData() async {
    final params = Params(loading: loading);
    final result = await _getProfileUseCase.execute(params);
    result.fold(
      (Failure failure) => showAlertMessage(failure.statusMessage),
      (ProfileDataModel profileData) {
        name.text = profileData.name ?? '';
        email.text = profileData.email ?? '';
        phone.text = profileData.mobile ?? '';
        bio.text = profileData.bio ?? '';
      },
    );
  }

  Future<void> changePassword() async {
    final params = ChangePasswordUseCaseParams(
      loading: changePasswordLoading,
      oldPassword: oldPassword.text,
      newPassword: newPassword.text,
      newPasswordConfirmation: confirmNewPassword.text,
    );

    final result = await _changePasswordUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (successMsg) {
        showAlertMessage(successMsg);
        UserDataLocal.instance.remove();
        Get.offAllNamed(Routes.onBoarding);
      },
    );
  }
}
