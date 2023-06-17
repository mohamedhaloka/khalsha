import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:khalsha/core/presentation/themes/colors_manager.dart';
import 'package:khalsha/core/utils.dart';
import 'package:khalsha/features/login/data/models/social_type_enum.dart';
import 'package:khalsha/features/login/domain/use_cases/login_use_case.dart';
import 'package:khalsha/features/login/domain/use_cases/social_login_use_case.dart';

import '../../../../../core/data/models/item_model.dart';
import '../../../../../core/data/models/user_data_model.dart';
import '../../../../../core/data/source/local/user_local.dart';
import '../../../../../core/domain/error/failures.dart';
import '../../../../../core/presentation/routes/app_routes.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;
  final SocialLoginUseCase _socialLoginUseCase;
  LoginController(this._loginUseCase, this._socialLoginUseCase);

  List<ItemModel> socials = const <ItemModel>[
    ItemModel(text: 'Google', image: 'google'),
    // ItemModel(text: 'Facebook', image: 'facebook'),
  ];

  RxBool loading = false.obs, passSecure = true.obs;

  TextEditingController account = TextEditingController(),
      password = TextEditingController();

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> login() async {
    if (_anyInputIsEmpty) {
      showAlertMessage('جميع الحقول مطلوبة');
      return;
    }
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    final params = LoginParams(
      loading: loading,
      password: password.text,
      account: account.text,
    );

    final result = await _loginUseCase.execute(params);
    result.fold(
      (Failure failure) => showAlertMessage(failure.statusMessage),
      (UserData userData) {
        if (userData.user?.userType != 'importer_exporter') {
          showDialog(
            'يمكنك تحميل تطبيق مقدم الخدمة والإستفاده بكافة مميزاته',
            doneText: 'تحميل',
            onDoneTapped: () {},
            backColor: ColorManager.secondaryColor,
          );
          return;
        }
        UserDataLocal.instance.save(userData.toJson());
        Get.offAllNamed(Routes.root);
      },
    );
  }

  bool get _anyInputIsEmpty => account.text.isEmpty || password.text.isEmpty;

  Future<void> googleSignIn() async {
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;
      log(googleSignInAuthentication!.accessToken.toString(),
          name: 'ACCESS TOKEN');
      log(googleSignInAuthentication.idToken.toString(), name: 'ID TOKEN');

      final params = SocialLoginParams(
        loading: loading,
        type: SocialType.google,
        accessToken: googleSignInAuthentication.accessToken.toString(),
      );
      final result = await _socialLoginUseCase.execute(params);
      result.fold(
        (Failure failure) => showAlertMessage(failure.statusMessage),
        (UserData userData) {
          UserDataLocal.instance.save(userData.toJson());
          Get.offAllNamed(Routes.root);
        },
      );
    } catch (error) {
      log(error.toString(), name: 'GOOGLE SIGN IN ERROR');
      showAlertMessage(error.toString());
    }
  }
}
