import 'package:dio/dio.dart';
import 'package:khalsha/core/data/services/http_service.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../../../../core/utils.dart';
import '../models/laboratory_data.dart';

abstract class LaboratoryRemoteDataSource {
  Future<Map<String, dynamic>> createOrder(
    LaboratoryData laboratoryData,
  );

  Future<Map<String, dynamic>> updateOrder(
    LaboratoryData laboratoryData,
  );
}

class LaboratoryRemoteDataSourceImpl extends LaboratoryRemoteDataSource {
  final HttpService _httpService;
  LaboratoryRemoteDataSourceImpl(this._httpService);

  @override
  Future<Map<String, dynamic>> createOrder(
      LaboratoryData laboratoryData) async {
    final formData = await _prepareFormData(laboratoryData);
    final response = await _httpService.post(
      'importer/laboratories',
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
      LaboratoryData laboratoryData) async {
    final formData = await _prepareFormData(laboratoryData);
    final response = await _httpService.post(
      'importer/laboratories/${laboratoryData.id}',
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

  Future<FormData> _prepareFormData(LaboratoryData laboratoryData) async {
    final formData = FormData.fromMap(laboratoryData.toJson());

    _fillDataOfList(
      formData,
      dataList: laboratoryData.certificate,
      key: 'certificate',
    );
    _fillDataOfList(
      formData,
      dataList: laboratoryData.itemServiceId,
      key: 'item_service_id',
    );
    _fillDataOfList(
      formData,
      dataList: laboratoryData.customsCode,
      key: 'customs_code',
    );
    _fillDataOfList(
      formData,
      dataList: laboratoryData.factoryName,
      key: 'factory_name',
    );
    _fillDataOfList(
      formData,
      dataList: laboratoryData.nameAr,
      key: 'name_ar',
    );
    _fillDataOfList(
      formData,
      dataList: laboratoryData.nameEn,
      key: 'name_en',
    );
    _fillDataOfList(
      formData,
      dataList: laboratoryData.photoCard,
      key: 'photo_card',
      type: kFile,
    );
    _fillDataOfList(
      formData,
      dataList: laboratoryData.photoItem,
      key: 'photo_item',
      type: kFile,
    );

    formData.files.addAll([
      MapEntry(
        "test_report_photo",
        await MultipartFile.fromFile(laboratoryData.testReport),
      ),
      MapEntry(
        "factory_audit_photo",
        await MultipartFile.fromFile(laboratoryData.factoryAudit),
      ),
    ]);

    return formData;
  }

  void _fillDataOfList(FormData formData,
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
