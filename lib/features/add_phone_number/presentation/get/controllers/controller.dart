import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/user_data_model.dart';

import '../../../../../core/data/source/local/user_local.dart';
import '../../../../../core/presentation/routes/app_routes.dart';
import '../../../../../core/utils.dart';
import '../../../../account_settings/domain/use_cases/update_account_use_case.dart';

class AddPhoneNumberController extends GetxController {
  final UpdateAccountUseCase _updateAccountUseCase;
  AddPhoneNumberController(this._updateAccountUseCase);

  TextEditingController phone = TextEditingController();

  Map<String, dynamic> userData = Get.arguments;

  RxBool loading = false.obs;

  void updatePhoneNumber() async {
    UserData userDateModel = UserData.fromJson(userData);

    UserDataLocal.instance.setToken(userDateModel.accessToken!);
    final params = UpdateAccountUseCaseParams(
      loading: loading,
      name: userDateModel.dataOrNull.name!,
      email: userDateModel.dataOrNull.email!,
      mobile: phone.text,
      bio: userDateModel.dataOrNull.bio ?? '',
      commercialCert: '',
    );

    final result = await _updateAccountUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (successMsg) {
        userDateModel.user!.mobile = phone.text;
        UserDataLocal.instance.save(userDateModel.toJson());
        Get.offAllNamed(Routes.root);
      },
    );
  }
}
