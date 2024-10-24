import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationsManager {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  LocalNotificationsManager();

  final List<String> notifications = [
    "Can't sleep? Let's do shopping!🩷",
    "Use code DivaNightOwls on ALL orders above 500 EGP until 3AM!📦",
    "Late-night shopping spree? We've got you covered!🛍️✨",
    "Up all night? Treat yourself to something special!💅🛒",
    "Midnight madness! Unlock exclusive deals before dawn!🌙💸",
    "Need a retail therapy break? Check out our late-night offers!🛍️💖",
    "Sleep can wait, but these deals can't!🔥 Hurry up!🛒",
    "Night owls, unite! Shop your favorites till 3 AM!🦉✨",
    "Too excited to sleep? Let’s shop the night away!🛒🌟",
    "Our best deals are waiting for you! Don't miss out tonight!⏳💸",
    "Feeling restless? Swipe and shop some happiness!🎁💃",
    "Nighttime is the right time for exclusive discounts!🛍️🌜"
  ];

  /// Initializes Local Notifications service
  Future<void> init() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("@drawable/launcher_icon");

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: DarwinInitializationSettings(
        requestSoundPermission: true,
        requestBadgePermission: true,
        requestAlertPermission: true,
      ),
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  /// Returns a random notification message
  String getRandomNotification() {
    return notifications[Random().nextInt(notifications.length)];
  }

  /// Generates a random time between 12 AM and 2 AM
  tz.TZDateTime getRandomTime() {
    final now = DateTime.now();
    int randomHour = 12 + Random().nextInt(2);
    int randomMinute = Random().nextInt(60);

    return tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      randomHour,
      randomMinute,
    );
  }


  /// Schedules Notification daily between 12AM : 2AM
  Future<void> scheduleDailyNotification() async {
    String randomMessage = getRandomNotification();
    final tz.TZDateTime scheduledTime = getRandomTime();
    int notificationId = Random().nextInt(1000);

    try {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        notificationId,
        'NightReminder',
        randomMessage,
        scheduledTime,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'daily_notification_channel_id',
            'Daily Notifications',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      debugPrint('Notification scheduled successfully');
    } catch (error) {
      debugPrint('Error scheduling notification: $error');
    }
  }



  Future<void> requestNotificationPermission() async {
    final NotificationAppLaunchDetails? details =
    await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (details?.didNotificationLaunchApp ?? false) {
      debugPrint('App was launched via notification');
    }

    if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      androidImplementation?.requestNotificationsPermission();
    }
  }
}
