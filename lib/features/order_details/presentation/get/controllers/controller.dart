import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../core/data/models/item_model.dart';

class OrderDetailsController extends GetxController {
  RxInt currentTab = 0.obs;
  PageController pageViewController = PageController();

  RxInt currentStatus = 1.obs;
  PageController statusSliderController = PageController(initialPage: 1);

  List<ItemModel> orderData = const <ItemModel>[
    ItemModel(text: 'عنوان الطلب', description: 'نقل أخشاب'),
    ItemModel(text: 'منفذ الشحنة', description: 'ميناء جدة'),
    ItemModel(text: 'نوع الشحنة', description: 'استيراد'),
    ItemModel(text: 'هل يوجد بند جمزكي', description: 'نعم'),
    ItemModel(text: 'إجمالي الفاتورة', description: '2500'),
    ItemModel(text: 'توصيل إلي', description: 'الرياض'),
    ItemModel(text: 'مجال الشحنة', description: 'شخصي'),
    ItemModel(text: 'نوع الشحن', description: 'طرد'),
    ItemModel(text: 'رقم البند الجمركي', description: '443322'),
    ItemModel(text: 'العملة', description: 'ريال سعودي'),
  ];

  List<ItemModel> orderRequirement = const <ItemModel>[
    ItemModel(text: 'نوع البضاعة', description: 'أخشاب'),
    ItemModel(text: 'نوع الطرد', description: 'صندوق خشبي'),
    ItemModel(text: 'إجمالي الحجم', description: '22 متر مربع'),
    ItemModel(text: 'إجمالي الوزن', description: '50 كيلو جرام'),
    ItemModel(text: 'الكمية', description: '33 عدد'),
    ItemModel(text: 'الحالة', description: 'إنتظار'),
  ];

  List<ItemModel> extraServices = const <ItemModel>[
    ItemModel(text: 'هل تريد التخزين', description: 'نعم'),
    ItemModel(text: 'عدد أيام التخزين', description: '44 يوم'),
    ItemModel(text: 'خدمة الفك', description: 'نعم'),
    ItemModel(text: 'خدمة التغليف', description: 'لا'),
    ItemModel(text: 'خدمة التركيب', description: 'نعم'),
    ItemModel(text: 'تخليص جمركي', description: 'لا'),
  ];

  List<ItemModel> status = const <ItemModel>[
    ItemModel(
      id: 0,
      statusId: 0,
      text: 'استلام الاوراق',
      image: 'receipt-of-papers',
    ),
    ItemModel(
      id: 1,
      statusId: 1,
      text: 'استلام التفويض',
      image: 'receipt-of-authorization',
    ),
    ItemModel(
      id: 2,
      statusId: 2,
      text: 'تحضير الاوراق',
      image: 'paper-preparation',
    ),
    ItemModel(
      id: 3,
      statusId: 2,
      text: 'استلام الشحنة',
      image: 'receive-the-shipment',
    ),
  ];

  void goToParticularPage(int id) => pageViewController.animateToPage(
        id,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

  void goToStatus() => statusSliderController.animateToPage(
        currentStatus.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
}
