import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/routes/app_routes.dart';
import 'package:khalsha/features/home/presentation/view.dart';
import 'package:khalsha/features/on_boarding/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/orders/presentation/view.dart';
import 'package:khalsha/features/profile/presentation/view.dart';
import 'package:khalsha/features/settlement/presentation/view.dart';

import '../../../../../core/models/item_model.dart';
import '../../../../notifications/presentation/view.dart';

class NavigationMenuController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  PageController pageController = PageController(initialPage: 2);

  List<ItemModel> pages = <ItemModel>[], menu = <ItemModel>[];

  RxInt currentTab = 2.obs;

  String get pageTitle => pages[currentTab.value].text;

  @override
  void onInit() {
    pages = const [
      ItemModel(
        id: 0,
        image: 'profile',
        text: 'حسابي',
        child: ProfileView(),
      ),
      ItemModel(
        id: 1,
        image: 'orders',
        text: 'عروضي',
        child: OrdersView(),
      ),
      ItemModel(
        id: 2,
        image: 'home',
        text: 'الرئيسية',
        child: HomeView(),
      ),
      ItemModel(
        id: 3,
        image: 'notification',
        text: 'الإشعارات',
        child: NotificationsView(),
      ),
      ItemModel(
        id: 4,
        image: 'settlement',
        text: 'التسوية',
        child: SettlementView(),
      ),
    ];

    menu = const [
      ItemModel(
        image: 'about',
        text: 'عن خلصها',
        route: Routes.onBoarding,
        arguments: IntroType.aboutApp,
      ),
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
      ItemModel(
        image: 'common_questions',
        text: 'الأسئلة الشائعة',
        route: Routes.commonQuestions,
      ),
      ItemModel(
        image: 'technical-support',
        text: 'الدعم للعملاء',
        route: Routes.contactUS,
      ),
      ItemModel(
        image: 'share',
        text: 'شارك خلصها',
        route: Routes.shareApp,
      ),
      ItemModel(
        image: 'how-to-use',
        text: 'طريقة الإستخدام',
        route: Routes.howToUse,
      ),
      ItemModel(
        image: 'setting',
        text: 'إعدادات الحساب',
        route: Routes.accountSettings,
      ),
    ];
    super.onInit();
  }

  void navigateToParticularPage(int? page) {
    pageController.animateToPage(
      page ?? 0,
      duration: const Duration(milliseconds: 450),
      curve: Curves.easeInOut,
    );
  }
}
