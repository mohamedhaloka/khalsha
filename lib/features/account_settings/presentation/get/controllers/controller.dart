import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/profile_data_model.dart';
import 'package:khalsha/core/data/source/local/user_local.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/download_file_use_case.dart';
import 'package:khalsha/core/domain/use_cases/get_profile_use_case.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/utils.dart' as utils;
import 'package:khalsha/core/utils.dart';
import 'package:khalsha/features/account_settings/domain/use_cases/change_password_use_case.dart';
import 'package:khalsha/features/account_settings/domain/use_cases/update_account_use_case.dart';
import 'package:khalsha/features/account_settings/domain/use_cases/upload_profile_photo_use_case.dart';

class AccountSettingsController extends GetxController {
  final GetProfileUseCase _getProfileUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final UpdateAccountUseCase _updateAccountUseCase;
  final UploadProfilePhotoUseCase _uploadProfilePhotoUseCase;
  final DownloadFileUseCase _downloadFileUseCase;
  AccountSettingsController(
    this._getProfileUseCase,
    this._changePasswordUseCase,
    this._updateAccountUseCase,
    this._uploadProfilePhotoUseCase,
    this._downloadFileUseCase,
  );

  Rx<File> profilePhoto = File('').obs, commercialCertificate = File('').obs;

  TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController(),
      // bio = TextEditingController(),
      oldPassword = TextEditingController(),
      newPassword = TextEditingController(),
      confirmNewPassword = TextEditingController();

  RxBool loading = false.obs;

  @override
  void onInit() {
    _getData();
    super.onInit();
  }

  Future<void> _getData() async {
    loading(true);
    await _getProfileData();
    loading(false);
  }

  Future<void> _downloadImage(String profilePhoto,
      {required void Function(String) onSuccess}) async {
    final params = DownloadFileUseCaseParams(
      loading: false.obs,
      url: profilePhoto,
    );
    final result = await _downloadFileUseCase.execute(params);
    result.fold(
      (_) => _,
      (String imagePath) => onSuccess(imagePath),
    );
  }

  Future<void> _getProfileData() async {
    final params = Params(loading: false.obs);
    final result = await _getProfileUseCase.execute(params);
    result.fold(
      (Failure failure) => utils.showAlertMessage(failure.statusMessage),
      (ProfileDataModel profileData) async {
        name.text = profileData.name ?? '';
        email.text = profileData.email ?? '';
        phone.text = profileData.mobile ?? '';
        // bio.text = profileData.bio ?? '';
        if (profileData.commercialCert != null) {
          await _downloadImage(
            profileData.commercialCert!,
            onSuccess: (imagePath) => commercialCertificate(File(imagePath)),
          );
        }
        if (profileData.photoProfile == null) return;
        await _downloadImage(
          profileData.photoProfile!,
          onSuccess: (imagePath) => profilePhoto(File(imagePath)),
        );
      },
    );
  }

  Future<void> changePassword() async {
    final params = ChangePasswordUseCaseParams(
      loading: loading,
      oldPassword: oldPassword.text,
      newPassword: newPassword.text,
      newPasswordConfirmation: confirmNewPassword.text,
    );

    final result = await _changePasswordUseCase.execute(params);
    result.fold(
      (failure) => utils.showAlertMessage(failure.statusMessage),
      (successMsg) {
        utils.showAlertMessage(successMsg);
        UserDataLocal.instance.remove();
        Get.offAllNamed(Routes.login);
      },
    );
  }

  Future<void> updateAccount() async {
    if (_phoneIsNotValid) {
      showAlertMessage('يرجى كتابة رقم هاتف بشكل صحيح');
      return;
    }
    final params = UpdateAccountUseCaseParams(
      loading: loading,
      name: name.text,
      email: email.text,
      mobile: phone.text,
      bio: '', //bio.text
      commercialCert: commercialCertificate.value.path,
    );

    final result = await _updateAccountUseCase.execute(params);
    result.fold(
      (failure) => utils.showAlertMessage(failure.statusMessage),
      (successMsg) => utils.showAlertMessage(successMsg),
    );
  }

  bool get _phoneIsNotValid =>
      !phone.text.startsWith('05') || phone.text.length != 10;

  Future<void> changeProfilePhoto() async {
    final params = UploadProfilePhotoUseCaseParams(
      loading: loading,
      imagePath: profilePhoto.value.path,
    );

    final result = await _uploadProfilePhotoUseCase.execute(params);
    result.fold(
      (failure) => utils.showAlertMessage(failure.statusMessage),
      (successMsg) => utils.showAlertMessage(successMsg),
    );
  }

  void showDeleteAccountDialog() {
    utils.showDialog(
      'هل تود حقاً حذف الحساب؟',
      doneText: 'نعم',
      onDoneTapped: () {
        UserDataLocal.instance.remove();
        Get.offAllNamed(Routes.login);
      },
    );
  }
}
