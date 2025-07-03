import 'package:bloc/bloc.dart';
import 'package:ecomflutter/Features/HomePage/Data/Models/notificationModel.dart';
import 'package:ecomflutter/Features/HomePage/Data/Repo/notifications_repo.dart';
import 'package:ecomflutter/main.dart';
import 'package:ecomflutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:meta/meta.dart';
import 'package:timezone/timezone.dart' as tz;

part 'notifications_page_state.dart';

class NotificationsPageCubit extends Cubit<NotificationsPageState> {
  NotificationsPageCubit() : super(NotificationsPageLoading()) {
    fetchNotifications();
  }
  void fetchNotifications() async {
    try {
      emit(NotificationsPageLoading());
      List<NotificationModel> notifications =
          await sl<NotificationsRepo>().getAllNotifications();
      debugPrint("Sent the notifications successfully");
      emit(NotificationsPageSuccess(notifications));
    } catch (e) {
      emit(NotificationsPageError(e.toString()));
    }
  }

  void deleteANotification(int id) async {
    try {
      await sl<NotificationsRepo>().deleteNotification(id);
      fetchNotifications(); // refresh
    } catch (e) {
      debugPrint("Failed to delete notification: $e");
      emit(NotificationsPageError("Failed to delete notification"));
    }
  }
}
