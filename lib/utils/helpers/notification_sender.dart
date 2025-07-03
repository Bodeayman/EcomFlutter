import 'package:ecomflutter/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> scheduleDailyReminderIfNeeded() async {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

  final prefs = await SharedPreferences.getInstance();
  final isScheduled = prefs.getBool('daily_reminder_scheduled') ?? false;

  if (isScheduled) {
    print('Daily reminder already scheduled. Skipping.');
    return;
  }

  final hasPermission = await requestExactAlarmPermission();
  if (!hasPermission) {
    print('Cannot schedule exact alarms - permission denied');
    return;
  }

  final now = tz.TZDateTime.now(tz.local);
  // var scheduledTime = tz.TZDateTime(
  //   tz.local,
  //   now.year,
  //   now.month,
  //   now.day,
  //   23,
  //   21,
  //   00,
  // );
  var scheduledTime = now.add(const Duration(minutes: 1));
  // if (scheduledTime.isBefore(now)) {
  //   scheduledTime = scheduledTime.add(const Duration(days: 1));
  // }

  print('Scheduling at: $scheduledTime');

  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'Daily Reminder',
    'Good morning! Come back to the app!',
    scheduledTime,
    const NotificationDetails(
      android: AndroidNotificationDetails(
        '123123',
        'JimTan',
        channelDescription: 'Reminder',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
        showWhen: true,
      ),
    ),
    androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );

  await prefs.setBool('daily_reminder_scheduled', true);
  print('Daily reminder scheduled and saved in preferences.');
}

Future<bool> requestExactAlarmPermission() async {
  final androidPlugin =
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

  if (androidPlugin != null) {
    final canSchedule = await androidPlugin.canScheduleExactNotifications();
    print('Can schedule exact alarms: $canSchedule');

    if (canSchedule == true) return true;

    await androidPlugin.requestExactAlarmsPermission();

    final canScheduleAfter =
        await androidPlugin.canScheduleExactNotifications();
    print('Can schedule after request: $canScheduleAfter');

    return canScheduleAfter == true;
  }

  return false;
}

Future<void> setupNotificationChannel() async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    '123123',
    'JimTan',
    description: 'Reminder',
    importance: Importance.max,
    playSound: true,
  );

  final androidPlugin =
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();

  if (androidPlugin != null) {
    await androidPlugin.createNotificationChannel(channel);
    print('Notification channel created: ${channel.id}');
  }
}
