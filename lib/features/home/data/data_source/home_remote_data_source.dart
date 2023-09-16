import 'package:khalsha/core/data/services/http_service.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../models/statistics_model.dart';

abstract class HomeRemoteDataSource {
  Future<StatisticsModel> getStatistics();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final HttpService _httpService;
  HomeRemoteDataSourceImpl(this._httpService);

  @override
  Future<StatisticsModel> getStatistics() async {
    final response = await _httpService.get('${HttpService.userType}/statistics');

    if (response.statusCode == 200) {
      return StatisticsModel.fromJson(response.data['data']);
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}
