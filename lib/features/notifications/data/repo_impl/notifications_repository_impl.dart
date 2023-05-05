import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/features/notifications/data/data_source/notifications_remote_data_source.dart';
import 'package:khalsha/features/notifications/data/models/notification_model.dart';
import 'package:khalsha/features/notifications/domain/repository/notifications_repository.dart';

import '../../../../core/domain/error/exceptions.dart';

class NotificationsRepositoryImpl extends NotificationsRepository {
  final NotificationsRemoteDataSource _remoteDataSource;
  NotificationsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications(
    String status,
    int pageIndex,
  ) async {
    try {
      final result =
          await _remoteDataSource.getNotifications(status, pageIndex);
      return right(result);
    } on ServerException catch (e) {
      return left(ServerFailure(statusMessage: e.errorMessage));
    } on DioError catch (e) {
      return left(ServerFailure(statusMessage: e.response!.data.toString()));
    }
  }
}
