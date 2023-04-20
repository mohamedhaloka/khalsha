import 'package:dio/dio.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';

import '../../../orders/data/models/order_model.dart';

abstract class OrderDetailsRemoteDataSource {
  Future<OrderModel> getOrderDetails(String type, int id);

  Future<String> updateStep(
    String type,
    int statusId,
    String status,
    String note,
  );
}

class OrderDetailsRemoteDataSourceImpl extends OrderDetailsRemoteDataSource {
  final HttpService _httpService;
  OrderDetailsRemoteDataSourceImpl(this._httpService);

  @override
  Future<OrderModel> getOrderDetails(String type, int id) async {
    final response = await _httpService.get('importer/$type/$id');
    if (response.statusCode == 200) {
      return OrderModel.fromJson(response.data['result']);
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<String> updateStep(
    String type,
    int statusId,
    String status,
    String note,
  ) async {
    final formData = FormData.fromMap({
      'status': status,
      'note': note,
    });
    final response = await _httpService.post(
        'importer/$type/action/step/$statusId', formData);
    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}
