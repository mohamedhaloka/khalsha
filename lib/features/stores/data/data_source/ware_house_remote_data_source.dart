import 'package:dio/dio.dart';
import 'package:khalsha/features/stores/data/models/ware_house_data_model.dart';

import '../../../../core/data/services/http_service.dart';
import '../../../../core/domain/error/exceptions.dart';

abstract class WareHouseRemoteDataSource {
  Future<Map<String, dynamic>> createOrder(
    WareHouseData wareHouseData,
  );

  Future<Map<String, dynamic>> updateOrder(
    WareHouseData wareHouseData,
  );
}

class WareHouseRemoteDataSourceImpl extends WareHouseRemoteDataSource {
  final HttpService _httpService;
  WareHouseRemoteDataSourceImpl(this._httpService);

  @override
  Future<Map<String, dynamic>> createOrder(WareHouseData wareHouseData) async {
    final formData = _prepareFormData(wareHouseData);
    final response = await _httpService.post(
      '${HttpService.userType}/warehouses',
      formData,
    );

    if (response.statusCode == 200) {
      return {
        'message': response.data['message'],
        'orderId': response.data['result']['id'],
      };
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<Map<String, dynamic>> updateOrder(WareHouseData wareHouseData) async {
    final formData = _prepareFormData(wareHouseData);
    Map<String, dynamic> data = {};
    for (var element in formData.fields) {
      data[element.key] = element.value;
    }
    final response = await _httpService.put(
      '${HttpService.userType}/warehouses/${wareHouseData.id}',
      data,
    );

    if (response.statusCode == 200) {
      return {
        'message': response.data['message'],
        'orderId': response.data['result']['id'],
      };
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  FormData _prepareFormData(WareHouseData wareHouseData) {
    final formData = FormData.fromMap(wareHouseData.toJson());

    _fillDataOfList(
      formData,
      dataList: wareHouseData.certificate,
      key: 'certificate',
    );
    return formData;
  }

  void _fillDataOfList(FormData formData,
      {required List<String> dataList, required String key}) {
    for (int i = 0; i < dataList.length; i++) {
      String item = dataList[i];
      if (item.isEmpty) continue;
      formData.fields.add(MapEntry('$key[$i]', item));
    }
  }
}
