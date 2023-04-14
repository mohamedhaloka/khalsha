import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/data/source/local/user_local.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/home/presentation/view.dart';
import 'package:khalsha/features/my_bills/presentation/view.dart';
import 'package:khalsha/features/on_boarding/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/orders/presentation/view.dart';
import 'package:khalsha/features/profile/presentation/view.dart';
import 'package:khalsha/features/root/domain/use_cases/log_out_use_case.dart';
import 'package:khalsha/features/root/domain/use_cases/refresh_token_use_case.dart';

import '../../../../../core/data/models/item_model.dart';
import '../../../../../core/presentation/routes/app_routes.dart';
import '../../../../../core/utils.dart';
import '../../../../notifications/presentation/view.dart';
import '../../../../settlement/presentation/view.dart';

class RootController extends GetxController {
  final RefreshTokenUseCase _refreshTokenUseCase;
  final LogOutUseCase _logiOutUseCase;
  RootController(
    this._refreshTokenUseCase,
    this._logiOutUseCase,
  );

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  PageController pageController = PageController(initialPage: 2);

  List<ItemModel> pages = <ItemModel>[], menu = <ItemModel>[];

  RxInt currentTab = 2.obs;

  String get pageTitle => pages[currentTab.value].text;

  RxString errorType = ''.obs;

  String get errorMessage {
    switch (errorType.value) {
      case 'need_verify_mobile':
        return 'يجب تفعيل جوالك عن طريق الكود المرسل له';
      case 'need_verify_email':
        return 'يجب تفعيل البريد الالكتروني عن طريق البيانات المرسلة للبريد الالكتروني الخاص بك';
    }
    return '';
  }

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
        child: NotificationsView(),
      ),
    ];

    if (!UserDataLocal.instance.isImporterExporter) {
      pages.add(
        const ItemModel(
          id: 4,
          image: 'settlement',
          text: 'التسوية',
          child: SettlementView(),
        ),
      );
    } else {
      pages.add(
        const ItemModel(
          id: 4,
          image: 'my-bills',
          text: 'فواتير',
          child: MyBillsView(),
        ),
      );
    }

    menu = [
      const ItemModel(
        image: 'about',
        text: 'عن خلصها',
        route: Routes.onBoarding,
        arguments: IntroType.aboutApp,
      ),
      const ItemModel(
        image: 'common_questions',
        text: 'الأسئلة الشائعة',
        route: Routes.commonQuestions,
      ),
      const ItemModel(
        image: 'technical-support',
        text: 'الدعم للعملاء',
        route: Routes.contactUS,
      ),
      const ItemModel(
        image: 'share',
        text: 'شارك خلصها',
        route: Routes.shareApp,
      ),
      const ItemModel(
        image: 'how-to-use',
        text: 'طريقة الإستخدام',
        route: Routes.howToUse,
      ),
      const ItemModel(
        image: 'setting',
        text: 'إعدادات الحساب',
        route: Routes.accountSettings,
      ),
    ];

    if (!UserDataLocal.instance.isImporterExporter) {
      menu.insertAll(
        1,
        const [
          ItemModel(
            image: 'blog',
            text: 'الإحصائيات',
            route: Routes.statistics,
          ),
          ItemModel(
            image: 'resources',
            text: 'الطلبات الجديدة',
            route: Routes.newOrders,
          ),
        ],
      );
    } else {
      menu.insertAll(
        1,
        const [
          ItemModel(
            image: 'blog',
            text: 'المدونة',
            route: Routes.blog,
          ),
          ItemModel(
            image: 'resources',
            text: 'المصادر',
            route: Routes.sources,
          ),
        ],
      );
    }
    _refreshToken();
    super.onInit();
  }

  void navigateToParticularPage(int? page) {
    if (errorType.isNotEmpty) return;
    pageController.animateToPage(
      page ?? 0,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _refreshToken() async {
    final params = Params(loading: false.obs);
    final result = await _refreshTokenUseCase.execute(params);
    result.fold(
      (failure) {
        final type = json.decode(failure.statusMessage ?? '')['type'];
        errorType(type);
      },
      (userData) => UserDataLocal.instance.save(userData.toJson()),
    );
  }

  Future<void> logOut() async {
    final params = Params(loading: false.obs);
    final result = await _logiOutUseCase.execute(params);
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
