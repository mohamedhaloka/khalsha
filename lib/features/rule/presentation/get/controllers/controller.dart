import 'dart:developer';

import 'package:get/get.dart';
import 'package:khalsha/features/rule/data/models/rule_model.dart';
import 'package:khalsha/features/rule/domain/use_cases/get_rule_data_use_case.dart';

import '../../../data/models/rule_type_enum.dart';

class RuleController extends GetxController {
  final GetRuleDataUseCase _getRuleDataUseCase;
  RuleController(this._getRuleDataUseCase);

  RuleType ruleType = Get.arguments;

  RxBool loading = true.obs;

  RuleModel? rule;

  @override
  void onInit() {
    _getRuleData();
    super.onInit();
  }

  Future<void> _getRuleData() async {
    final params =
        GetRuleDataUseCaseParams(loading: loading, ruleType: ruleType);
    final result = await _getRuleDataUseCase.execute(params);
    result.fold(
      (failure) => log(failure.statusMessage ?? '', name: 'Failure'),
      (data) => rule = data,
    );
  }

  String get pageTitle {
    switch (ruleType) {
      case RuleType.aboutUs:
        return 'about-us';
      case RuleType.termsAndConditions:
        return 'terms-conditions';
      case RuleType.privacyPolicy:
        return 'privacy-policy';
      case RuleType.faq:
        return 'faq';
      case RuleType.howToUse:
        return 'how-to-use';
    }
  }
}

enum StaticPageType {
  aboutUs,
  termsAndConditions,
  privacyPolicy,
}
