import 'package:get/get.dart';
import 'package:khalsha/core/models/item_model.dart';

class StatisticsController extends GetxController {
  RxList<int> selectedServicesFilter = <int>[].obs;

  List<ItemModel> periodsStatistic = const <ItemModel>[
    ItemModel(
      text: '3,000',
      description: 'أرباح اليوم',
      statusId: 0,
    ),
    ItemModel(
      text: '27,000',
      description: 'أرباح الأسبوع',
      statusId: 1,
    ),
    ItemModel(
      text: '60,000',
      description: 'أرباح الشهر',
      statusId: 1,
    ),
    ItemModel(
      text: '250,000',
      description: 'أرباح السنة',
      statusId: 0,
    ),
  ];
  List<ItemModel> postsFilters = const <ItemModel>[
    ItemModel(
      id: 0,
      text: 'منشورات مقبولة',
      description: '3',
    ),
    ItemModel(
      id: 1,
      text: 'منشورات بالإنتظار',
      description: '20',
    ),
    ItemModel(
      id: 2,
      text: 'منشورات مرفوضة',
      description: '5',
    ),
  ];
  List<ItemModel> offersFilters = const <ItemModel>[
    ItemModel(
      id: 0,
      text: 'عروض مقبولة',
      description: '6',
    ),
    ItemModel(
      id: 1,
      text: 'عروض بالإنتظار',
      description: '30',
    ),
    ItemModel(
      id: 2,
      text: 'عروض مرفوضة',
      description: '12',
    ),
  ];
}
