import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/features/settlement/data/models/settlement.dart';

abstract class SettlementRemoteDataSource {
  Future<List<SettlementModel>> getSettlements();
}

class SettlementRemoteDataSourceImpl extends SettlementRemoteDataSource {
  final HttpService _httpService;
  SettlementRemoteDataSourceImpl(this._httpService);

  @override
  Future<List<SettlementModel>> getSettlements() async {
    final response = await _httpService.get('provider/settlements');

    if (response.statusCode == 200) {
      final data = response.data['data']['settlements']['data'];
      List<SettlementModel> settlements = <SettlementModel>[];

      for (var item in data) {
        settlements.add(SettlementModel.fromJson(item));
      }
      return settlements;
    } else {
      throw ServerException(errorMessage: response.data.toString());
    }
  }
}
