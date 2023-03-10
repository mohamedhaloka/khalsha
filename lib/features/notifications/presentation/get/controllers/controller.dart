import 'package:get/get.dart';
import 'package:khalsha/core/models/item_model.dart';

class NotificationsController extends GetxController {
  List<ItemModel> notifications = <ItemModel>[];

  @override
  void onInit() {
    notifications = const [
      ItemModel(
        text: 'تمت بنجاح',
        description:
            'تمت عملية التفاوض مع مقدم الخدمة بنجاح انتقل إلي طلباتك لتصفح العرض للعلم بآخر التطورات.',
      ),
      ItemModel(
        text: 'خطأ',
        description:
            'تم رفض عملية التفاوض مع مقدم الخدمة انتقل إلي طلباتك لتعرف سبب عملية الرفض.',
      ),
      ItemModel(
        text: 'تنبيه',
        description:
            'يرجي العلم أن ميعاد تسديد الفواتير لمقدم الخدمة سيكون يوم 12 شهر نوفمبر.',
      ),
      ItemModel(
        text: 'لمعلوماتك',
        description:
            'الوزارة الخارجية لدولة الصين ستقوم بإعداد مؤتمر في مدينة الرياض بالسعودية يوم الإثنين القادم.',
      ),
    ];
    super.onInit();
  }
}
