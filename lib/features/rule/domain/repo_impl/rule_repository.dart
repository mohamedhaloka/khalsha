import 'package:dartz/dartz.dart';
import 'package:khalsha/features/rule/data/models/rule_type_enum.dart';

import '../../../../core/domain/error/failures.dart';
import '../../data/models/rule_model.dart';

abstract class RuleRepository {
  Future<Either<Failure, RuleModel>> getRuleData(RuleType ruleType);
}
