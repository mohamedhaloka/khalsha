import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/rule/data/data_source/rule_remote_data_source.dart';
import 'package:khalsha/features/rule/data/models/rule_model.dart';
import 'package:khalsha/features/rule/data/models/rule_type_enum.dart';
import 'package:khalsha/features/rule/domain/repo/rule_repository.dart';

class RuleRepositoryImpl extends BaseRepositoryImpl implements RuleRepository {
  final RuleRemoteDataSource _ruleRemoteDataSource;
  RuleRepositoryImpl(this._ruleRemoteDataSource);

  @override
  Future<Either<Failure, RuleModel>> getRuleData(RuleType ruleType) async {
    return request(() async {
      final result = await _ruleRemoteDataSource.getRuleData(ruleType);
      return right(result);
    });
  }
}
