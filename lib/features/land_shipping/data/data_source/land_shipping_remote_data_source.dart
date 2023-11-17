import 'package:dio/dio.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/features/land_shipping/data/models/land_shipping_data.dart';

import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/utils.dart';

abstract class LandShippingRemoteDataSource {
  Future<Map<String, dynamic>> createOrder(LandShippingData data);

  Future<Map<String, dynamic>> updateOrder(LandShippingData data);
}

class LandShippingRemoteDataSourceImpl extends LandShippingRemoteDataSource {
  final HttpService _httpService;
  LandShippingRemoteDataSourceImpl(this._httpService);

  @override
  Future<Map<String, dynamic>> createOrder(LandShippingData data) async {
    final formData = await _prepareFormData(data);
    final response = await _httpService.post(
      '${HttpService.userType}/landshippings',
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
  Future<Map<String, dynamic>> updateOrder(LandShippingData data) async {
    final formData = await _prepareFormData(data);

    final response = await _httpService.post(
      '${HttpService.userType}/landshippings/${data.orderId}',
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

  Future<FormData> _prepareFormData(LandShippingData data) async {
    final formData = FormData.fromMap(data.toJson());

    _fillDataOfList(
      formData,
      dataList: data.loading,
      key: 'loading',
    );
    _fillDataOfList(
      formData,
      dataList: data.loadingLat,
      key: 'loading_lat',
    );
    _fillDataOfList(
      formData,
      dataList: data.loadingLng,
      key: 'loading_lng',
    );
    _fillDataOfList(
      formData,
      dataList: data.delivery,
      key: 'delivery',
    );
    _fillDataOfList(
      formData,
      dataList: data.deliveryLat,
      key: 'delivery_lat',
    );
    _fillDataOfList(
      formData,
      dataList: data.deliveryLng,
      key: 'delivery_lng',
    );

    if (data.goodsType == 'bundled_goods') {
      _fillDataOfList(
        formData,
        dataList: data.bundleName,
        key: 'bundel_name',
      );
      _fillDataOfList(
        formData,
        dataList: data.bundleQuantity,
        key: 'bundel_quantity',
      );
      _fillDataOfList(
        formData,
        dataList: data.bundleUnit,
        key: 'bundel_unit',
      );
      _fillDataOfList(
        formData,
        dataList: data.bundleTotalWeight,
        key: 'bundel_total_weight',
      );
      await _fillDataOfList(
        formData,
        dataList: data.bundleImage,
        key: 'bundel_image',
        type: kFile,
      );
    } else {
      _fillDataOfList(
        formData,
        dataList: data.descLoading,
        key: 'desc_loading',
      );
      _fillDataOfList(
        formData,
        dataList: data.descDelivery,
        key: 'desc_delivery',
      );
      _fillDataOfList(
        formData,
        dataList: data.name,
        key: 'name',
      );
      _fillDataOfList(
        formData,
        dataList: data.quantity,
        key: 'quantity',
      );
      _fillDataOfList(
        formData,
        dataList: data.pack,
        key: 'pack',
      );
      _fillDataOfList(
        formData,
        dataList: data.unpack,
        key: 'unpack',
      );
      _fillDataOfList(
        formData,
        dataList: data.packaging,
        key: 'packaging',
      );
    }

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
