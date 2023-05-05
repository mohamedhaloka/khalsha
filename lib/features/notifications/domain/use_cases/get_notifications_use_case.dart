import 'package:dartz/dartz.dart';
import 'package:khalsha/features/notifications/data/models/notification_model.dart';
import 'package:khalsha/features/notifications/domain/repository/notifications_repository.dart';

import '../../../../core/domain/error/failures.dart';
import '../../../../core/domain/use_cases/use_case.dart';

class GetNotificationsUseCase
    extends UseCase<List<NotificationModel>, GetNotificationsUseCaseParams> {
  final NotificationsRepository _notificationsRepository;
  GetNotificationsUseCase(this._notificationsRepository);

  @override
  Future<Either<Failure, List<NotificationModel>>> execute(
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
