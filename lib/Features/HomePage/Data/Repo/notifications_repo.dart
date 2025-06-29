import 'package:ecomflutter/Features/HomePage/Data/Models/notificationModel.dart';
import 'package:ecomflutter/utils/usefulFunctions.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationsRepo {
  final _client = Supabase.instance.client;

  Future<List<NotificationModel>> getAllNotifications() async {
    try {
      final user = _client.auth.currentUser;

      if (user == null) {
        throw Exception("No user is logged in");
      }

      final notificationsBox = Hive.box<NotificationModel>('allNotifications');
      final connected = await isConnected();
      if (!connected) {
        final cachedItems = notificationsBox.values.toList();
        if (cachedItems.isNotEmpty) {
          debugPrint("Returned cached data from Hive");
          return (cachedItems);
        }
      }
      final response = await _client
          .from('Notifications')
          .select()
          .eq('user_id', user.id);

      List<NotificationModel> notifications =
          (response as List)
              .map((item) => NotificationModel.fromMap(item))
              .toList();
      await notificationsBox.clear();
      await notificationsBox.addAll(notifications);
      return notifications;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<void> addNotificationForConfirmingOrder() async {
    final user = _client.auth.currentUser;

    if (user == null) {
      throw Exception("User not logged in");
    }

    final now = DateTime.now();
    final deliveryDate = now.toIso8601String();

    try {
      final response =
          await _client.from('Notifications').insert({
            'user_id': user.id,
            'content':
                "Your order has been confirmed, and it's on its way to shipping  ",
            'delivery_date': deliveryDate,
          }).select();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteNotification(int id) async {
    final user = _client.auth.currentUser;
    debugPrint("Deleting now $id");

    if (user == null) {
      throw Exception("User not logged in");
    }
    try {
      print("Deleting notification with ID: $id");

      await _client.from('Notifications').delete().eq('id', id);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
