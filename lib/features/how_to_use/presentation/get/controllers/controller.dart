import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../on_boarding/data/models/on_boarding_item_model.dart';

class HowToUseController extends GetxController {
  List<OnBoardingItemModel> slides = <OnBoardingItemModel>[];

  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void onInit() {
    slides = const <OnBoardingItemModel>[
      OnBoardingItemModel(
        image: '1',
        title: 'قم بتسحيل الدخول',
        subTitle:
            "إذا كنت مستورد أو مصدر  أو مقدم خدمات لوجستية عن طريق إدخال بيانتك كاملة بشكل آمن وسليم.",
      ),
      OnBoardingItemModel(
        image: '2',
        title: 'قم بتصفح العروض',
        subTitle:
            "اختر من الصفحة الرئيسية الخدمة المراد تصفح عروضها ، وقم بتصفح العروض واختر منها الطلب المناسب لك وارسل لعميلك عرض السعر مقابل الخدمة المرادة.",
      ),
      OnBoardingItemModel(
        image: '3',
        title: 'انتظر اشعارك بالموافقة',
        subTitle:
            "سيتم اشعارك بعد فترة قصيرة بالموافقة أو الرفض من قبل طالب الخدمة ، وتستطيع عندها الشروع بالبدأ في استكمال الخدمة وان تزود المستفيد بمراحل الخدمة بمرور الوقت.",
      ),
      OnBoardingItemModel(
        image: '4',
        title: 'إتمام العملية بنجاح',
        subTitle:
            "بعد إتمام الخدمة  قم بإرسال الفاتورة النهائية ، وقم باالتوصل مع المستورد أو المصدر بطرق الدفع المناسبة لك.",
      ),
      OnBoardingItemModel(
        image: '5',
        title: 'معرفة إحصائياتك',
        subTitle:
            "تستطيع معرفة الخدمات التي طلبتها بكل التفاصيل التي أجريتها خلال (يوم - شهر - سنة) ، لتسهل عليك إحصاء أعمالك بدون أي صعوبات.",
      ),
      OnBoardingItemModel(
        image: '6',
        title: 'خلصها معك بأي وقت',
        subTitle:
            "هذه كانت طرق بشكل مبسط لتستطيع إستخدام التطبيق بسهولة ، إن واجهت أي مشاكل يمكنك التواصل مع الدعم الفني وترك رسالتك وسنتواصل مع بأقرب وقت ممكن.",
      ),
    ];
    super.onInit();
  }

  void goNext() {
    if (currentPage == slides.length - 1) {
      Get.back();
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
