import 'package:khalsha/core/data/services/http_service.dart';

import '../../../../core/domain/error/exceptions.dart';
import '../models/notification_model.dart';

abstract class NotificationsRemoteDataSource {
  Future<List<NotificationModel>> getNotifications(
    String status,
    int pageIndex,
  );
}

class NotificationsRemoteDataSourceImpl extends NotificationsRemoteDataSource {
  final HttpService _httpService;
  NotificationsRemoteDataSourceImpl(this._httpService);

  @override
  Future<List<NotificationModel>> getNotifications(
      String status, int pageIndex) async {
    final response = await _httpService
        .get('auth/notifications?status=$status&page=$pageIndex');

    if (response.statusCode == 200) {
      final notifications = <NotificationModel>[];

      for (var notification in response.data['result']['data']) {
        notifications.add(NotificationModel.fromJson(notification));
      }
      return notifications;
    } else {
      throw ServerException(errorMessage: response.data['message'].toString());
    }
  }
}
