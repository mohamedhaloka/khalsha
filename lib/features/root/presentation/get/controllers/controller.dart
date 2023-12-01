import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/models/item_model.dart';
import 'package:khalsha/core/data/services/notification_service.dart';
import 'package:khalsha/core/data/source/local/user_local.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/core/presentation/routes/app_routes.dart';
import 'package:khalsha/core/utils.dart' as utils;
import 'package:khalsha/features/auth/presentation/get/controllers/auth_controller.dart';
import 'package:khalsha/features/home/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/home/presentation/view.dart';
import 'package:khalsha/features/my_bills/presentation/view.dart';
import 'package:khalsha/features/notifications/domain/use_cases/get_notifications_use_case.dart';
import 'package:khalsha/features/notifications/presentation/view.dart';
import 'package:khalsha/features/on_boarding/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/orders/presentation/view.dart';
import 'package:khalsha/features/profile/presentation/view.dart';
import 'package:khalsha/features/root/domain/use_cases/log_out_use_case.dart';
import 'package:khalsha/features/root/domain/use_cases/refresh_token_use_case.dart';
import 'package:khalsha/features/root/domain/use_cases/update_fcm_token_use_case.dart';
import 'package:khalsha/features/rule/data/models/rule_type_enum.dart';

class RootController extends GetxController {
  final GetNotificationsUseCase _getNotificationsUseCase;
  final RefreshTokenUseCase _refreshTokenUseCase;
  final LogOutUseCase _logOutUseCase;
  final UpdateFCMTokenUseCase _updateFCMTokenUseCase;
  RootController(
    this._refreshTokenUseCase,
    this._logOutUseCase,
    this._updateFCMTokenUseCase,
    this._getNotificationsUseCase,
  );

  int initialPage = Get.arguments ?? 2;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  PageController pageController = PageController(initialPage: 2);

  List<ItemModel> pages = <ItemModel>[], menu = <ItemModel>[];

  RxBool loading = true.obs;
  RxInt currentTab = 2.obs;
  RxInt unSeenNotificationCount = 0.obs;

  String get pageTitle => pages[currentTab.value].text;

  String? get errorMessage {
    switch (authStatus.value) {
      case AuthStatus.verifyPhone:
        return 'يجب تفعيل جوالك عن طريق الكود المرسل له';
      case AuthStatus.verifyEmail:
        return 'يجب تفعيل البريد الالكتروني عن طريق البيانات المرسلة للبريد الالكتروني الخاص بك';
      default:
        return null;
    }
  }

  final _notificationService = Get.find<NotificationsService>();
  final _homeController = Get.find<HomeController>();
  final _authController = Get.find<AuthController>();

  Rx<AuthStatus> get authStatus => _authController.authStatus;
  bool get needToVerifyAccount =>
      authStatus.value == AuthStatus.verifyPhone ||
      authStatus.value == AuthStatus.verifyEmail;

  @override
  void onInit() {
    pages = [
      const ItemModel(
        id: 0,
        image: 'profile',
        text: 'حسابي',
        child: ProfileView(),
      ),
      const ItemModel(
        id: 1,
        image: 'orders',
        text: 'طلباتي',
        child: OrdersBody(),
      ),
      const ItemModel(
        id: 2,
        image: 'home',
        text: 'الرئيسية',
        child: HomeView(),
      ),
      const ItemModel(
        id: 3,
        image: 'notification',
        text: 'الإشعارات',
        child: NotificationsBody(),
      ),
      const ItemModel(
        id: 4,
        image: 'my-bills',
        text: 'فواتير',
        child: MyBillsView(),
      ),
    ];

    menu = [
      const ItemModel(
        image: 'about',
        text: 'عن خلصها',
        route: Routes.onBoarding,
        arguments: IntroType.aboutApp,
      ),
      const ItemModel(
        image: 'blog',
        text: 'المدونة',
        route: Routes.blog,
      ),
      const ItemModel(
        image: 'resources',
        text: 'المصادر',
        route: Routes.sources,
      ),
      const ItemModel(
        image: 'common_questions',
        text: 'الأسئلة الشائعة',
        route: Routes.rule,
        arguments: RuleType.faq,
      ),
      const ItemModel(
        image: 'technical-support',
        text: 'دعم العملاء',
        route: Routes.contactUS,
      ),
      const ItemModel(
        id: 5,
        image: 'share',
        text: 'شارك خلصها',
      ),
      const ItemModel(
        image: 'setting',
        text: 'إعدادات الحساب',
        route: Routes.accountSettings,
      ),
      const ItemModel(
        image: 'about',
        text: 'privacy-policy',
        route: 'https://khlasha.com/privacy/policy',
      ),
    ];

    _refreshToken();
    super.onInit();
  }

  void navigateToParticularPage(int page) {
    if (page == 3) {
      unSeenNotificationCount(0);
    }
    pageController.jumpToPage(page);
  }

  Future<void> _getUnSeenNotifications() async {
    final params = GetNotificationsUseCaseParams(
      loading: false.obs,
      pageIndex: 0,
      status: 'unseen',
    );
    final result = await _getNotificationsUseCase.execute(params);
    result.fold(
      (_) => _,
      (result) => unSeenNotificationCount(result.total),
    );
  }

  Future<void> _refreshToken() async {
    final params = Params(loading: loading);
    final result = await _refreshTokenUseCase.execute(params);
    FlutterNativeSplash.remove();
    _homeController.videoController.play();
    result.fold(
      (_) => _,
      (userData) async {
        if (initialPage != 2) {
          navigateToParticularPage(initialPage);
        }
        await UserDataLocal.instance.save(userData.toJson());
        _updateFCMToken();
        _getUnSeenNotifications();
        _notificationService.onGetInitialMessage();
      },
    );
  }

  Future<void> showLogOutDialog() => utils.showDialog(
        'هل تود حقاً تسجيل الخروج',
        onDoneTapped: _logOut,
        doneText: 'نعم',
      );

  Future<void> _logOut() async {
    Get.back();
    Get.back();
    final params = Params(loading: loading);
    await _logOutUseCase.execute(params);
    UserDataLocal.instance.remove();
    Get.offAllNamed(Routes.login);
  }

  Future<void> _updateFCMToken() async {
    _notificationService.subscribeToTopic(NotificationsService.topicName);
    final fcmToken = await _notificationService.getFCMToken();
    if (fcmToken == null) return;
    final params = UpdateFCMTokenUseCaseParams(
      loading: false.obs,
      fcmToken: fcmToken,
    );
    await _updateFCMTokenUseCase.execute(params);
  }
}
