import 'package:khalsha/features/rule/data/models/rule_model.dart';

import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/features/rule/data/models/rule_type_enum.dart';

abstract class RuleRemoteDataSource {
  Future<RuleModel> getRuleData(RuleType ruleType);
}

class RuleRemoteDataSourceImpl extends RuleRemoteDataSource {
  final HttpService _httpService;
  RuleRemoteDataSourceImpl(this._httpService);

  @override
  Future<RuleModel> getRuleData(RuleType ruleType) async {
    final response =
        await _httpService.get('page/${RuleType.values.indexOf(ruleType) + 1}');
    if (response.statusCode == 200 && response.data['status']) {
      return RuleModel.fromJson(response.data['result']);
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}
