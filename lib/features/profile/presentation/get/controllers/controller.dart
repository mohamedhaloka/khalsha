import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../core/data/models/profile_data_model.dart';
import '../../../../../core/domain/error/failures.dart';
import '../../../../../core/domain/use_cases/get_profile_use_case.dart';
import '../../../../../core/domain/use_cases/use_case.dart';
import '../../../../../core/utils.dart';

class ProfileController extends GetxController {
  final GetProfileUseCase _getProfileUseCase;
  ProfileController(this._getProfileUseCase);

  TextEditingController name = TextEditingController(),
      email = TextEditingController(),
      commercialCertificate = TextEditingController(),
      phone = TextEditingController();

  RxBool loading = true.obs;

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
        commercialCertificate.text = (profileData.commercialCert ?? '').isEmpty
            ? 'لم يتم رفع الملف حتى الان'
            : 'تم رفع الملف';
      },
    );
  }
}
