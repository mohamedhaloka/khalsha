import 'package:get/get.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/settlement/data/models/settlement.dart';
import 'package:khalsha/features/settlement/domain/use_cases/get_settlements_use_case.dart';

import '../../../../../core/utils.dart';

class SettlementController extends GetxController {
  final GetSettlementsUseCase _getSettlementsUseCase;
  SettlementController(this._getSettlementsUseCase);

  List<SettlementModel> settlements = <SettlementModel>[];

  RxBool loading = false.obs;
  @override
  void onInit() {
    _getSettlements();
    super.onInit();
  }

  Future<void> _getSettlements() async {
    final params = Params(loading: loading);
    final result = await _getSettlementsUseCase.execute(params);
    result.fold(
      (failure) => showAlertMessage(failure.statusMessage),
      (data) => settlements.addAll(data),
    );
  }
}
