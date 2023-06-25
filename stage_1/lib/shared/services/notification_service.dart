import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static final FlutterLocalNotificationsPlugin _notification =
      FlutterLocalNotificationsPlugin();
  static final onNotification = BehaviorSubject<String?>();

  Future<tz.TZDateTime> _scheduleDaily(Time time) async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 17, 10);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  Future _notificationDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channel_id', 'channel_name',
            channelDescription: 'channel_description',
            importance: Importance.max,
            priority: Priority.high),
        iOS: IOSNotificationDetails());
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notification.show(id, title, body, await _notificationDetails(),
          payload: payload);

  Future<void> init({bool initSchedule = false}) async {
    AndroidInitializationSettings android =
        const AndroidInitializationSettings('app_icon');
    IOSInitializationSettings iOS = const IOSInitializationSettings();

    final settings = InitializationSettings(android: android, iOS: iOS);
    await _notification.initialize(settings,
        onSelectNotification: (payload) async {
      onNotification.add(payload);
    });

    // await flutterLocalNotificationsPlugin.initialize(initializationSettings,
    //     onSelectNotification: selectNotification);
    // tz.initializeTimeZones();
  }

  void showScheduleNotification(
          {int id = 0,
          String? title,
          String? body,
          String? payload,
          required DateTime scheduleDate}) async =>
      _notification.zonedSchedule(
          id,
          title,
          body,
          await _scheduleDaily(const Time(17, 15)),
          await _notificationDetails(),
          payload: payload,
          androidAllowWhileIdle: true,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.time);

  // tz.TZDateTime _nextInstanceOfTenAM() {
  //   final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  //   tz.TZDateTime scheduledDate =
  //       tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
  //   if (scheduledDate.isBefore(now)) {
  //     scheduledDate = scheduledDate.add(const Duration(days: 1));
  //   }
  //   return scheduledDate;
  // }
}
