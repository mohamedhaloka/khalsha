import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../core/presentation/routes/app_routes.dart';
import '../../../data/models/on_boarding_item_model.dart';

class OnBoardingController extends GetxController {
  IntroType introType = Get.arguments ?? IntroType.onBoarding;

  List<OnBoardingItemModel> slides = <OnBoardingItemModel>[];

  PageController pageController = PageController();
  RxInt currentPage = 0.obs;

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
          title: 'منصة رقمية للخدمات اللوجستية',
          subTitle:
              'تعتبر خلصها اول منصة رقمية متكاملة توفر جميع الخدمات اللوجستية في مكان واحد ، كما انها توفر للعملاء الحصول على خدمات متعددة بنفس الوقت وذلك من أجل تسهيل ومتابعة أعمالهم.'),
      OnBoardingItemModel(
        image: '2',
        title: 'خلصها وأكثر ..',
        subTitle: '''أنت لا تحتاج الى فريق متكامل 
فهنا في منصة خلصها و بغضون دقائق معدودة وبأقل جهد
تستطيع ارسال الطلب الخاص بك بطريقة محترفة وسهلة 
ومن ثم الحصول على عروض أسعار مصممة خصيصاً لك
لملائمة متطلباتك واحتياجاتك.''',
      ),
      OnBoardingItemModel(
        image: '3',
        title: 'ابحث .. وفر .. قارن',
        subTitle:
            'عند اختيارك احد الخدمات وبعد تعبئة الطلب سوف يقوم النظام بجمع وتحليل المعلومات بما في ذلك الأسعار والخدمات المقدمة والاراء حول مزودين هذه الخدمات ، و يقدمها لك بطريقة سهلة ومنظمة تساعدك في اتخاذ القرار المناسب .',
      )
    ];
    super.onInit();
  }

  String get btnText {
    if (introType == IntroType.onBoarding) {
      if (currentPage.value == slides.length - 1) return 'إستكشاف';
      return 'التالي';
    }

    if (currentPage.value == slides.length - 1) return 'الرئيسية';
    return 'التالي';
  }

  void goNext() {
    if (currentPage.value == slides.length - 1) {
      onReachEnd();
      return;
    }
    currentPage++;
    pageController.animateToPage(
      currentPage.value,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

enum IntroType { onBoarding, aboutApp }
