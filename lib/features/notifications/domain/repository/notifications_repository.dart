import 'package:dartz/dartz.dart';

import '../../../../core/domain/error/failures.dart';
import '../../data/models/notification_model.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, List<NotificationModel>>> getNotifications(
    String status,
    int pageIndex,
  );
}
