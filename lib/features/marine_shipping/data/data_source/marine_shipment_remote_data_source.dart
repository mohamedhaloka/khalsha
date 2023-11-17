import 'package:dio/dio.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/features/marine_shipping/data/models/marine_shipment_data.dart';

import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/utils.dart';

abstract class MarineShipmentRemoteDataSource {
  Future<Map<String, dynamic>> createOrder(
    MarineShipmentData marineShipmentData,
  );

  Future<Map<String, dynamic>> updateOrder(
    MarineShipmentData marineShipmentData,
  );
}

class MarineShipmentRemoteDataSourceImpl
    extends MarineShipmentRemoteDataSource {
  final HttpService _httpService;
  MarineShipmentRemoteDataSourceImpl(this._httpService);

  @override
  Future<Map<String, dynamic>> createOrder(
      MarineShipmentData marineShipmentData) async {
    final formData = await _prepareFormData(marineShipmentData);
    final response = await _httpService.post(
      '${HttpService.userType}/seashippings',
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
      MarineShipmentData marineShipmentData) async {
    final formData = await _prepareFormData(marineShipmentData);
    final response = await _httpService.post(
      '${HttpService.userType}/seashippings/${marineShipmentData.id}',
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

  Future<FormData> _prepareFormData(
      MarineShipmentData marineShipmentData) async {
    final formData = FormData.fromMap(marineShipmentData.toJson());

    _fillDataOfList(
      formData,
      dataList: marineShipmentData.certificate,
      key: 'certificate',
    );

    _fillDataOfList(
      formData,
      dataList: marineShipmentData.containerType,
      key: 'container_type',
    );

    _fillDataOfList(
      formData,
      dataList: marineShipmentData.containerCount,
      key: 'container_count',
    );
    _fillDataOfList(
      formData,
      dataList: marineShipmentData.containerContent,
      key: 'content_',
    );
    await _fillDataOfList(
      formData,
      dataList: marineShipmentData.image,
      key: 'image',
      type: kFile,
    );
    _fillDataOfList(
      formData,
      dataList: marineShipmentData.goodsTotalWeight,
      key: 'total_weight',
    );
    _fillDataOfList(
      formData,
      dataList: marineShipmentData.goodsOverallSize,
      key: 'overall_size',
    );
    _fillDataOfList(
      formData,
      dataList: marineShipmentData.goodsQuantity,
      key: 'quantity',
    );
    _fillDataOfList(
      formData,
      dataList: marineShipmentData.goodsUnitType,
      key: 'unit_type',
    );
    _fillDataOfList(
      formData,
      dataList: marineShipmentData.goodsLength,
      key: 'length',
    );
    _fillDataOfList(
      formData,
      dataList: marineShipmentData.goodsHeight,
      key: 'height',
    );
    _fillDataOfList(
      formData,
      dataList: marineShipmentData.goodsWidth,
      key: 'width',
    );
    _fillDataOfList(
      formData,
      dataList: marineShipmentData.goodsWeightPerUnit,
      key: 'weight_per_unit',
    );
    _fillDataOfList(
      formData,
      dataList: marineShipmentData.goodsCM,
      key: 'cm',
    );

    return formData;
  }

  Future<void> _fillDataOfList(FormData formData,
      {required List<String> dataList,
      required String key,
      String type = kField}) async {
    for (int i = 0; i < dataList.length; i++) {
      String item = dataList[i];
      if (item.isEmpty) continue;
      if (type == kField) {
        formData.fields.add(MapEntry('$key[$i]', item));
        continue;
      }
      formData.files.add(
        MapEntry(
          '$key[$i]',
          await MultipartFile.fromFile(item),
        ),
      );
    }
  }
}
