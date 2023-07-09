import 'package:dartz/dartz.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/rule/domain/repo_impl/rule_repository.dart';

import '../../data/models/rule_model.dart';
import '../../data/models/rule_type_enum.dart';

class GetRuleDataUseCase extends UseCase<RuleModel, GetRuleDataUseCaseParams> {
  final RuleRepository _ruleRepository;
  GetRuleDataUseCase(this._ruleRepository);

  @override
  Future<Either<Failure, RuleModel>> execute(
      GetRuleDataUseCaseParams params) async {
    params.loading(true);
    final call = _ruleRepository.getRuleData(params.ruleType);
    call.then((_) => params.loading(false));
    return call;
  }
}

class GetRuleDataUseCaseParams extends Params {
  final RuleType ruleType;
  GetRuleDataUseCaseParams({
    required super.loading,
    required this.ruleType,
  });
}
