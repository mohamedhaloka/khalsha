import 'package:get/get.dart';

import '../../../domain/entities/customs_clause_model.dart';

class AdditionalServiceStepController extends GetxController {
  RxInt numberOfStorage = 0.obs;

  RxList<CustomsClauseModel> customsClauseList = <CustomsClauseModel>[].obs;

  void addNewClause() => customsClauseList.add(CustomsClauseModel.newItem());
}
