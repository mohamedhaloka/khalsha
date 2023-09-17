import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/presentation/extentions/response_extension.dart';
import 'package:khalsha/features/rule/data/data_source/rule_remote_data_source.dart';
import 'package:khalsha/features/rule/data/models/rule_type_enum.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../domain/repo/rule_repository.dart';
import '../models/rule_model.dart';

class RuleRepositoryImpl extends RuleRepository {
  final RuleRemoteDataSource _ruleRemoteDataSource;
  RuleRepositoryImpl(this._ruleRemoteDataSource);

  @override
  Future<Either<Failure, RuleModel>> getRuleData(RuleType ruleType) async {
    try {
      final result = await _ruleRemoteDataSource.getRuleData(ruleType);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.getErrorMessage()));
    }
  }
}
