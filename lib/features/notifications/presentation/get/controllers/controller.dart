import 'package:get/get.dart';
import 'package:khalsha/features/notifications/data/models/notification_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../core/utils.dart';
import '../../../domain/use_cases/get_notifications_use_case.dart';

class NotificationsController extends GetxController {
  final GetNotificationsUseCase _getNotificationsUseCase;
  NotificationsController(this._getNotificationsUseCase);

  List<NotificationModel> notifications = <NotificationModel>[];

  int currentPage = 1;

  RxBool loading = true.obs;

  RefreshController refreshController = RefreshController();
  @override
  void onInit() {
    _getNotifications();
    super.onInit();
  }

  Future<void> _getNotifications() async {
    final params = GetNotificationsUseCaseParams(
      loading: loading,
      pageIndex: currentPage,
      status: 'all',
    );
    final result = await _getNotificationsUseCase.execute(params);
    result.fold(
      (failure) {
        showAlertMessage(failure.statusMessage);
        currentPage = currentPage - 1;
      },
      (data) {
        if (data.isEmpty) {
          currentPage = currentPage - 1;
          return;
        }
        notifications.addAll(data);
      },
    );
  }

  Future<void> onRefresh() async {
    notifications.clear();
    currentPage = 1;
    loading(true);
    await _getNotifications();
    refreshController.refreshCompleted();
  }

  Future<void> onLoading() async {
    currentPage++;
    await _getNotifications();
    refreshController.loadComplete();
  }
}
