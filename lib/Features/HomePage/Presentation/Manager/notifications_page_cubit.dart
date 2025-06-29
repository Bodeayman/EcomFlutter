import 'package:bloc/bloc.dart';
import 'package:ecomflutter/Features/HomePage/Data/Models/notificationModel.dart';
import 'package:ecomflutter/Features/HomePage/Data/Repo/notifications_repo.dart';
import 'package:ecomflutter/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'notifications_page_state.dart';

class NotificationsPageCubit extends Cubit<NotificationsPageState> {
  NotificationsPageCubit() : super(NotificationsPageLoading()) {
    fetchNotifications();
  }
  void fetchNotifications() async {
    try {
      List<NotificationModel> notifications =
          await sl<NotificationsRepo>().getAllNotifications();
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
