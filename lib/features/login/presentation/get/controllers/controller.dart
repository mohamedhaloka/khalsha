import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/utils.dart';
import 'package:khalsha/features/login/domain/use_cases/login_use_case.dart';

import '../../../../../core/data/local_storage/user_local.dart';
import '../../../../../core/data/models/item_model.dart';
import '../../../../../core/data/models/user_data_model.dart';
import '../../../../../core/domain/error/failures.dart';
import '../../../../../core/presentation/routes/app_routes.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;
  LoginController(this._loginUseCase);

  List<ItemModel> socials = const <ItemModel>[
    ItemModel(text: 'Google', image: 'google'),
    ItemModel(text: 'Facebook', image: 'facebook'),
  ];

  RxBool loading = false.obs, passSecure = true.obs;

  TextEditingController account = TextEditingController(),
      password = TextEditingController();

  Future<void> login() async {
    if (_anyInputIsEmpty) {
      showAlertMessage('جميع الحقول مطلوبة');
      return;
    }
    final params = LoginParams(
      loading: loading,
      password: password.text,
      account: account.text,
    );

    final result = await _loginUseCase.execute(params);
    result.fold(
      (Failure failure) => showAlertMessage(failure.statusMessage),
      (UserData userData) {
        UserDataLocal.instance.save(userData.toJson());
        Get.offAllNamed(Routes.navigationMenu);
      },
    );
  }

  bool get _anyInputIsEmpty => account.text.isEmpty || password.text.isEmpty;
}
