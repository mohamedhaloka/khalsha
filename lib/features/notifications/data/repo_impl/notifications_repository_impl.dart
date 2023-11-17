import 'package:dartz/dartz.dart';
import 'package:khalsha/core/data/repository_impl/base_repository_impl.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/notifications/data/data_source/notifications_remote_data_source.dart';
import 'package:khalsha/features/notifications/data/models/notification_response_model.dart';
import 'package:khalsha/features/notifications/domain/repository/notifications_repository.dart';

class NotificationsRepositoryImpl extends BaseRepositoryImpl
    implements NotificationsRepository {
  final NotificationsRemoteDataSource _remoteDataSource;
  NotificationsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, NotificationResponseModel>> getNotifications(
    String status,
    int pageIndex,
  ) async {
    return request(() async {
      final result =
          await _remoteDataSource.getNotifications(status, pageIndex);
      return right(result);
    });
  }
}
