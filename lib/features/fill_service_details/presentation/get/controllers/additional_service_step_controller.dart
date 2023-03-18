import 'package:get/get.dart';
import 'package:khalsha/features/fill_service_details/presentation/get/controllers/fill_service_details_controller.dart';
import 'package:khalsha/features/service_intro/presentation/get/controllers/controller.dart';

import '../../../domain/entities/customs_clause_model.dart';

class AdditionalServiceStepController extends GetxController {
  final _fillServiceDetailsController =
      Get.find<FillServiceDetailsController>();
  ServiceType get serviceType => _fillServiceDetailsController.serviceType;

  RxInt numberOfStorage = 0.obs;

  RxList<CustomsClauseModel> customsClauseList = <CustomsClauseModel>[].obs;

  void addNewClause() => customsClauseList.add(CustomsClauseModel.newItem());
}
