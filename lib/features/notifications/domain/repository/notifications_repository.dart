import 'package:dartz/dartz.dart';

import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/notifications/data/models/notification_response_model.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, NotificationResponseModel>> getNotifications(
    String status,
    int pageIndex,
  );
}
