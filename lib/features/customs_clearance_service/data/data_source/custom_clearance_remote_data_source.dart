import 'package:dio/dio.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';

import '../models/customs_clearance_data.dart';

abstract class CustomsClearanceRemoteDataSource {
  Future<String> createOrder(CustomsClearanceData customsClearanceData);
}

class CustomsClearanceRemoteDataSourceImpl
    extends CustomsClearanceRemoteDataSource {
  final HttpService _httpService;
  CustomsClearanceRemoteDataSourceImpl(this._httpService);

  @override
  Future<String> createOrder(CustomsClearanceData customsClearanceData) async {
    final formData = FormData.fromMap(customsClearanceData.toJson());

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

    final response = await _httpService.post(
      'importer/customsclearance',
      formData,
    );
    print(response.data);

    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
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
