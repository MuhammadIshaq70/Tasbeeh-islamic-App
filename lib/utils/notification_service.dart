import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'dart:math' as math;

class LocalNotificationServices {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  void initializeNotification() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void sendNotification() async {
    await flutterLocalNotificationsPlugin.show(
        0,
        'plain title',
        'plain body',
        NotificationDetails(
            android: AndroidNotificationDetails('channel id', 'channel NAME',
                importance: Importance.max,
                priority: Priority.high,
                ticker: 'test ticker')));
  }

  void schedulNotification() async {
    print("Scheduling notification");
    log("Scheduling notification");
    await flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        'scheduled title',
        'scheduled body',
        payload: 'item x',
        androidAllowWhileIdle: true,
        RepeatInterval.everyMinute,
        NotificationDetails(
            android: AndroidNotificationDetails('1', 'khan',
                importance: Importance.max,
                priority: Priority.high,
                ticker: 'test ticker')));
  }

  Future zonedScheduleNotification(String note, DateTime date, body) async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Karachi'));
    // tz.TZDateTime.parse(location, formattedString)
    int id = math.Random().nextInt(10000);

    log(date.toString());
    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        body,
        note,
        tz.TZDateTime.from(date, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'channel id',
            'channel NAME',
            channelDescription: 'your channel description',
            largeIcon: DrawableResourceAndroidBitmap("@mipmap/ic_launcher"),
            icon: "@mipmap/ic_launcher",
            sound: RawResourceAndroidNotificationSound(''),
            importance: Importance.max,
            priority: Priority.max,
            fullScreenIntent: true,
            enableLights: true,
            enableVibration: true,
            visibility: NotificationVisibility.public,
            showWhen: true,
            showProgress: true,
            playSound: true,
            timeoutAfter: 10000,
            ongoing: true,
          ),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
      return id;
    } catch (e) {
      log("Error at zonedScheduleNotification----------------------------$e");
      if (e ==
          "Invalid argument (scheduledDate): Must be a date in the future: Instance of 'TZDateTime'") {
        Fluttertoast.showToast(msg: "Select future date");
      }
      return -1;
    }
  }
}
