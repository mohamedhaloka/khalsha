import 'package:khalsha/features/notifications/data/models/notification_model.dart';

class NotificationResponseModel {
  int total;
  List<NotificationModel> data;

  NotificationResponseModel({
    required this.total,
    required this.data,
  });

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) =>
      NotificationResponseModel(
        total: json['total'],
        data: List.from(json['data'])
            .map((e) => NotificationModel.fromJson(e))
            .toList(),
      );
}
