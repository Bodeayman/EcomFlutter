import 'package:ecomflutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> activiteNotifications() async {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

  // 2. Request permission (optional but recommended for Android 13+)
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.requestExactAlarmsPermission();

  // 3. Initialize plugin
  const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  const initSettings = InitializationSettings(android: androidSettings);
  await flutterLocalNotificationsPlugin.initialize(initSettings);

  // 4. Create channel
  const channel = AndroidNotificationChannel(
    'channel_id',
    'channel_name',
    description: 'Daily reminders',
    importance: Importance.max,
  );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);

  // 5. Schedule daily notification at 9:00 AM
  final now = tz.TZDateTime.now(tz.local);
  var scheduledTime = tz.TZDateTime(
    tz.local,
    now.year,
    now.month,
    now.day,
    2, // hour
    36, // minute
    00, // second
  );

  // // If 9:00 AM already passed today, schedule for tomorrow
  if (scheduledTime.isBefore(now)) {
    scheduledTime = scheduledTime.add(const Duration(days: 1));
  }

  print('Flutter thinks local TZ is: ${tz.local}');
  print('Scheduling for: $scheduledTime');

  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'Daily Reminder',
    'Good morning! Come back to the app!',
    scheduledTime,
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        channelDescription: 'Reminder',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
        showWhen: true,
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,

    matchDateTimeComponents: DateTimeComponents.time,
  );
}
