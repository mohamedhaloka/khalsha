import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:khalsha/core/routes/app_routes.dart';

import '../../../data/models/on_boarding_item_model.dart';

class OnBoardingController extends GetxController {
  IntroType introType = Get.arguments ?? IntroType.onBoarding;

  List<OnBoardingItemModel> slides = <OnBoardingItemModel>[];

  PageController pageController = PageController();
  int currentPage = 0;

  String get pageTitle {
    switch (introType) {
      case IntroType.onBoarding:
        return '';
      case IntroType.aboutApp:
        return 'عن خلصها';
    }
  }

  void onReachEnd() {
    switch (introType) {
      case IntroType.onBoarding:
        Get.toNamed(Routes.intro);
        break;
      case IntroType.aboutApp:
        Get.back();
        break;
    }
  }

  @override
  void onInit() {
    slides = const <OnBoardingItemModel>[
      OnBoardingItemModel(
        image: '1',
        title: 'خلصها وأكثر ..',
        subTitle:
            '''في حال كنت مستورد أو مصدر  فأنت لا تحتاج الى فريق متكامل  فهنا في منصة خلصها و بغضون دقائق معدودة وبأقل جهد تستطيع أرسال الطلب الخاص بشحنتك وبطريقة محترفة وسهلة ومن ثم الحصول على عروض الأسعار المصممة خصيصاً لك.''',
      ),
      OnBoardingItemModel(
        image: '2',
        title: 'وسع نطاق أعمالك',
        subTitle:
            '''اذا كنت أحد مقدمين الخدمات اللوجستية ( التخليص الجمركي – الشحن البري – الشحن البحري - الشحن الجوي – المستودعات – المخازن – المختبرات و المواصفات ) فنحن هنا لدعم معاملاتك اليومية لجميع هذه الخدمات , بعبارة أخرى نحن ندعم فريق مبيعاتك وإيراداتك وحصتك السوقية من خلال منظومة رقمية متكاملة.''',
      ),
      OnBoardingItemModel(
        image: '3',
        title: 'أول منصة رقمية للخدمات اللوجستية',
        subTitle:
            '''تعتبر خلصها أول منصة رقمية تقدم جميع الخدمات اللوجستية في مكان واحد و بطريقة ذكية و سهلة ، حيث انها تساهم في تمكين المستورد أو المصدر بالبحث عن جميع مزودين الخدمات اللوجستية  كما أن منصة خلصها تمتاز في تقليل التكاليف المترتبة من حيث سهولة البحث عن الخدمة المطلوبة مع مقارنة الأسعار.''',
      )
    ];
    super.onInit();
  }

  void goNext() {
    if (currentPage == slides.length - 1) {
      onReachEnd();
      return;
    }
    currentPage++;
    pageController.animateToPage(
      currentPage,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

enum IntroType { onBoarding, aboutApp }
