import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/core/presentation/utils/enums/service_types_enum.dart';
import 'package:khalsha/features/orders/domain/entities/order_model.dart';

abstract class OrderDetailsRemoteDataSource {
  Future<OrderModel> getOrderDetails(String type, int id);

  Future<String> updateStep(
    String type,
    int statusId,
    String status,
    String note,
  );

  Future<String> acceptRejectOffer(
    String type,
    String status,
    String orderId,
  );

  Future<void> rateOrder(
    double rate,
    String feedback,
    String orderId,
    String module,
  );
}

class OrderDetailsRemoteDataSourceImpl extends OrderDetailsRemoteDataSource {
  final HttpService _httpService;
  OrderDetailsRemoteDataSourceImpl(this._httpService);

  @override
  Future<OrderModel> getOrderDetails(String type, int id) async {
    final response = await _httpService.get('importer/$type/$id');
    if (response.statusCode == 200) {
      ServiceTypes? serviceType =
          ServiceTypes.values.firstWhereOrNull((e) => e.value == type);
      return serviceType!.getModel(response.data['result']);
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
    final formData = dio.FormData.fromMap({
      'status': status,
      'note': note,
    });
    final response = await _httpService.post(
      '${HttpService.userType}/$type/action/step/$statusId',
      formData,
    );
    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<String> acceptRejectOffer(
    String type,
    String status,
    String orderId,
  ) async {
    final formData = dio.FormData.fromMap({
      'status': status,
    });
    final response = await _httpService.post(
      '${HttpService.userType}/${type.toLowerCase()}/action/offer/$orderId',
      formData,
    );
    if (response.statusCode == 200) {
      return response.data['message'];
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }

  @override
  Future<void> rateOrder(
    double rate,
    String feedback,
    String orderId,
    String module,
  ) async {
    final formData = dio.FormData.fromMap({
      'rating': rate.toInt(),
      'feedback': feedback,
      'module_id': orderId,
      'module': module,
    });
    final response = await _httpService.post(
      'auth/add/rate',
      formData,
    );
    if (response.statusCode != 200) {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}

extension ServiceTypesToModel on ServiceTypes {
  OrderModel getModel(Map<String, dynamic> json) {
    switch (this) {
      case ServiceTypes.customsClearance:
        return CustomsClearanceOrder.fromJson(json);
      case ServiceTypes.landShipping:
        return LandShippingOrder.fromJson(json);
      case ServiceTypes.stores:
        return WareHouseOrder.fromJson(json);
      case ServiceTypes.marineShipping:
        return MarineShipmentOrder.fromJson(json);
      case ServiceTypes.airFreight:
        return AirFreightOrder.fromJson(json);
      case ServiceTypes.laboratoryAndStandards:
        return LaboratoryOrder.fromJson(json);
      default:
        return CustomsClearanceOrder.fromJson(json);
    }
  }
}
