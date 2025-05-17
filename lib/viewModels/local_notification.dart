import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tasker/models/local_notification.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzData;

part 'local_notification.g.dart';

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

@riverpod
class NotificationService extends _$NotificationService {
  @override
  Future<void> build() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          MacOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    tzData.initializeTimeZones();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings darwin = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    const initSettings = InitializationSettings(
      android: android,
      iOS: darwin,
      macOS: darwin,
    );
    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  Future<void> scheduleNotification(LocalNotification noti) async {
    final androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Channel',
      importance: Importance.max,
      priority: Priority.high,
    );

    final tzTime = tz.TZDateTime.from(noti.scheduledTime, tz.local);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      noti.id,
      noti.title,
      noti.body,
      tzTime,
      NotificationDetails(android: androidDetails),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
