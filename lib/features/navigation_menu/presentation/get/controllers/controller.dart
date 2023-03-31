import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalsha/features/home/presentation/view.dart';
import 'package:khalsha/features/my_bills/presentation/view.dart';
import 'package:khalsha/features/on_boarding/presentation/get/controllers/controller.dart';
import 'package:khalsha/features/orders/presentation/view.dart';
import 'package:khalsha/features/profile/presentation/view.dart';
import 'package:khalsha/main.dart';

import '../../../../../core/data/models/item_model.dart';
import '../../../../../core/presentation/routes/app_routes.dart';
import '../../../../notifications/presentation/view.dart';
import '../../../../settlement/presentation/view.dart';

class NavigationMenuController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  PageController pageController = PageController(initialPage: 2);

  List<ItemModel> pages = <ItemModel>[], menu = <ItemModel>[];

  RxInt currentTab = 2.obs;

  String get pageTitle => pages[currentTab.value].text;

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
        text: 'عروضي',
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

    if (provider) {
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

    if (provider) {
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
