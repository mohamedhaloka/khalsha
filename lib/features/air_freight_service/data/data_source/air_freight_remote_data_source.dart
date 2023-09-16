import 'package:dio/dio.dart';
import 'package:khalsha/core/data/services/http_service.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../../../core/utils.dart';
import '../models/air_freight_data.dart';

abstract class AirFreightRemoteDataSource {
  Future<Map<String, dynamic>> createOrder(
    AirFreightData airFreightData,
  );

  Future<Map<String, dynamic>> updateOrder(
    AirFreightData airFreightData,
  );
}

class AirFreightRemoteDataSourceImpl extends AirFreightRemoteDataSource {
  final HttpService _httpService;
  AirFreightRemoteDataSourceImpl(this._httpService);

  @override
  Future<Map<String, dynamic>> createOrder(
      AirFreightData airFreightData) async {
    final formData = await _prepareFormData(airFreightData);
    final response = await _httpService.post(
      '${HttpService.userType}/airshippings',
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
      AirFreightData airFreightData) async {
    final formData = await _prepareFormData(airFreightData);
    final response = await _httpService.post(
      '${HttpService.userType}/airshippings/${airFreightData.id}',
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

  Future<FormData> _prepareFormData(AirFreightData airFreightData) async {
    final formData = FormData.fromMap(airFreightData.toJson());

    _fillDataOfList(
      formData,
      dataList: airFreightData.certificate,
      key: 'certificate',
    );

    await _fillDataOfList(
      formData,
      dataList: airFreightData.image,
      key: 'image',
      type: kFile,
    );

    _fillDataOfList(
      formData,
      dataList: airFreightData.name,
      key: 'name',
    );

    _fillDataOfList(
      formData,
      dataList: airFreightData.quantity,
      key: 'quantity',
    );

    _fillDataOfList(
      formData,
      dataList: airFreightData.length,
      key: 'length',
    );
    _fillDataOfList(
      formData,
      dataList: airFreightData.height,
      key: 'height',
    );
    _fillDataOfList(
      formData,
      dataList: airFreightData.width,
      key: 'width',
    );
    _fillDataOfList(
      formData,
      dataList: airFreightData.weightPerUnit,
      key: 'weight_per_unit',
    );
    _fillDataOfList(
      formData,
      dataList: airFreightData.cm,
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
