import 'package:dio/dio.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';

import '../models/customs_clearance_data.dart';

abstract class CustomsClearanceRemoteDataSource {
  Future<Map<String, dynamic>> createOrder(
    CustomsClearanceData customsClearanceData,
  );

  Future<Map<String, dynamic>> updateOrder(
    CustomsClearanceData customsClearanceData,
  );
}

class CustomsClearanceRemoteDataSourceImpl
    extends CustomsClearanceRemoteDataSource {
  final HttpService _httpService;
  CustomsClearanceRemoteDataSourceImpl(this._httpService);

  @override
  Future<Map<String, dynamic>> createOrder(
      CustomsClearanceData customsClearanceData) async {
    final formData = _prepareFormData(customsClearanceData);
    final response = await _httpService.post(
      'importer/customsclearance',
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
  Future<Map<String, dynamic>> updateOrder(
      CustomsClearanceData customsClearanceData) async {
    final formData = _prepareFormData(customsClearanceData);
    Map<String, dynamic> data = {};
    for (var element in formData.fields) {
      data[element.key] = element.value;
    }
    final response = await _httpService.put(
      'importer/customsclearance/${customsClearanceData.orderId}',
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

  FormData _prepareFormData(CustomsClearanceData customsClearanceData) {
    final formData = FormData.fromMap(customsClearanceData.toJson());

    _fillDataOfList(
      formData,
      dataList: customsClearanceData.certificate,
      key: 'certificate',
    );
    _fillDataOfList(
      formData,
      dataList: customsClearanceData.customsItemIds,
      key: 'customs_item_ids',
    );
    _fillDataOfList(
      formData,
      dataList: customsClearanceData.goodTypeId,
      key: 'good_type_id',
    );
    _fillDataOfList(
      formData,
      dataList: customsClearanceData.containerType,
      key: 'container_type',
    );
    _fillDataOfList(
      formData,
      dataList: customsClearanceData.containerSize,
      key: 'container_size',
    );
    _fillDataOfList(
      formData,
      dataList: customsClearanceData.containerCount,
      key: 'container_count',
    );
    _fillDataOfList(
      formData,
      dataList: customsClearanceData.parcelType,
      key: 'parcel_type',
    );
    _fillDataOfList(
      formData,
      dataList: customsClearanceData.otherParcel,
      key: 'other_parcel',
    );
    _fillDataOfList(
      formData,
      dataList: customsClearanceData.totalSize,
      key: 'total_size',
    );
    _fillDataOfList(
      formData,
      dataList: customsClearanceData.totalWeight,
      key: 'total_weight',
    );
    _fillDataOfList(
      formData,
      dataList: customsClearanceData.quantity,
      key: 'quantity',
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
