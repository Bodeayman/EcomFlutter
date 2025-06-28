part of 'notifications_page_cubit.dart';

@immutable
sealed class NotificationsPageState {}

final class NotificationsPageSuccess extends NotificationsPageState {
  final List<Map<String, dynamic>> notifications;
  NotificationsPageSuccess(this.notifications);
}

final class NotificationsPageLoading extends NotificationsPageState {}

final class NotificationsPageError extends NotificationsPageState {
  final String errMessage;
  NotificationsPageError(this.errMessage);
}
