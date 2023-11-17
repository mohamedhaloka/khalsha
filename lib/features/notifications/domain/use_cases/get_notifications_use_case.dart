import 'package:dartz/dartz.dart';
import 'package:khalsha/features/notifications/domain/repository/notifications_repository.dart';

import 'package:khalsha/core/domain/error/failures.dart';
import 'package:khalsha/core/domain/use_cases/use_case.dart';
import 'package:khalsha/features/notifications/data/models/notification_response_model.dart';

class GetNotificationsUseCase
    extends UseCase<NotificationResponseModel, GetNotificationsUseCaseParams> {
  final NotificationsRepository _notificationsRepository;
  GetNotificationsUseCase(this._notificationsRepository);

  @override
  Future<Either<Failure, NotificationResponseModel>> execute(
      GetNotificationsUseCaseParams params) {
    final call = _notificationsRepository.getNotifications(
      params.status,
      params.pageIndex,
    );
    call.then((_) => params.loading(false));
    return call;
  }
}

class GetNotificationsUseCaseParams extends Params {
  final String status;
  final int pageIndex;
  GetNotificationsUseCaseParams({
    required super.loading,
    required this.status,
    required this.pageIndex,
  });
}
