import 'package:khalsha/core/data/services/http_service.dart';
import 'package:khalsha/core/domain/error/exceptions.dart';
import 'package:khalsha/features/notifications/data/models/notification_response_model.dart';

abstract class NotificationsRemoteDataSource {
  Future<NotificationResponseModel> getNotifications(
    String status,
    int pageIndex,
  );
}

class NotificationsRemoteDataSourceImpl extends NotificationsRemoteDataSource {
  final HttpService _httpService;
  NotificationsRemoteDataSourceImpl(this._httpService);

  @override
  Future<NotificationResponseModel> getNotifications(
      String status, int pageIndex) async {
    final response = await _httpService
        .get('auth/notifications?status=$status&page=$pageIndex');

    if (response.statusCode == 200) {
      return NotificationResponseModel.fromJson(response.data['result']);
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}
