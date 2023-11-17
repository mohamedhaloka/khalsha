import 'package:get/get.dart';

class AuthController extends GetxController {
  Rx<AuthStatus> authStatus = AuthStatus.none.obs;

  void changeStatus(AuthStatus status) => authStatus(status);
}

enum AuthStatus {
  none,
  unAuthorized,
  verifyPhone,
  verifyEmail,
}
