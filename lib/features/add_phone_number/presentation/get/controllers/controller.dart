import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/user_data_model.dart';
import 'package:khalsha/core/data/source/local/user_local.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/utils.dart';
import 'package:khalsha/features/account_settings/domain/use_cases/update_account_use_case.dart';

class AddPhoneNumberController extends GetxController {
  final UpdateAccountUseCase _updateAccountUseCase;
  AddPhoneNumberController(this._updateAccountUseCase);

  TextEditingController phone = TextEditingController();

  Map<String, dynamic> userData = Get.arguments;

  RxBool loading = false.obs;

  void updatePhoneNumber() async {
    if (_phoneIsNotValid) {
      showAlertMessage('يرجى كتابة رقم هاتف بشكل صحيح');
      return;
    }

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
      (successMsg) async {
        userDateModel.user!.mobile = phone.text;
        await UserDataLocal.instance.save(userDateModel.toJson());
        Get.offAllNamed(Routes.root);
      },
    );
  }

  bool get _phoneIsNotValid =>
      !phone.text.startsWith('05') || phone.text.length != 10;
}
