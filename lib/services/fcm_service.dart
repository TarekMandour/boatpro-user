import 'dart:convert';
import 'dart:math';
import 'package:example/models/fcm_notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'notification_service.dart';
import '../../../ui/index.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer' as dev;

const String appIcon = '@mipmap/ic_launcher';
const String _channelId = 'high_importance_channel';
const String _channelName = 'High Importance Notifications';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  final title = message.notification?.title ?? '';
  final body = message.notification?.body ?? '';
  // Show notification for data-only background messages
  if (title.isNotEmpty || body.isNotEmpty) {
    await flutterLocalNotificationsPlugin.show(
      message.hashCode,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          importance: Importance.max,
          priority: Priority.high,
          icon: appIcon,
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }
}

class FcmService extends NotificationService {
  final _instance = FirebaseMessaging.instance;
  final _nav = locator<NavigationService>();
  final _prefService = locator<PreferencesService>();
  final _commonService = locator<CommonService>();

  final String _topicAllDevices = '';
  // FlutterLocalNotificationsPlugin flutterNotificationPlugin =
  //     FlutterLocalNotificationsPlugin();

  Future init({
    required NotificationDelegate notificationDelegate,
  }) async {
    // var initializationSettingsAndroid =
    //     const AndroidInitializationSettings(appIcon);
    //
    // var initializationSettingsIOS = const IOSInitializationSettings();
    //
    // var initializationSettings = InitializationSettings(
    //     android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    //
    // flutterNotificationPlugin = FlutterLocalNotificationsPlugin();
    //
    // flutterNotificationPlugin.initialize(initializationSettings,
    //     onSelectNotification: (payload) => onSelectNotification(payload));

    delegate = notificationDelegate;

    // Initialize flutter_local_notifications
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings();
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(android: androidInit, iOS: iosInit),
    );

    await _instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    _instance.getToken().then((token) async {
      debugPrint('[FirebaseCloudMessaging] Token FCM > $token');
      _prefService.setFCMToken(token);
    });
    _instance.onTokenRefresh.listen((newToken) {
      debugPrint('[FirebaseCloudMessaging] Token refreshed > $newToken');
      _prefService.setFCMToken(newToken);
    });
    _instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    // var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    //   'Notification Channel ID',
    //   'Channel Name',
    //   importance: Importance.max,
    //   priority: Priority.high,
    //   icon: appIcon,
    // );
    // var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    // var platformChannelSpecifics = NotificationDetails(
    //     android: androidPlatformChannelSpecifics,
    //     iOS: iOSPlatformChannelSpecifics);

    RemoteMessage? initialMessage = await _instance.getInitialMessage();
    dev.log('####### initialMessage ######## $initialMessage');
    if (initialMessage != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final messageId = prefs.getString('messageId');
      if (messageId == null ||
          messageId == '' ||
          messageId != initialMessage.messageId) {
        prefs.setString('messageId', initialMessage.messageId ?? '');
        Timer.periodic(const Duration(milliseconds: 500), (timer) {
          timer.cancel(); // important **
          Random random = Random();
          delegate.onMessageOpenedApp(FCMNotificationItem(
              id: initialMessage.messageId ?? random.toString(),
              title: initialMessage.notification?.title ?? '',
              body: initialMessage.notification?.body ?? '',
              additionalData: initialMessage.data,
              date: DateTime.now()));
        });
      }
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final title = message.notification?.title ?? '';
      final body = message.notification?.body ?? '';
      Random random = Random();
      final notification = FCMNotificationItem(
        id: message.messageId ?? random.toString(),
        title: title,
        body: body,
        additionalData: message.data,
        date: DateTime.now(),
      );
      delegate.onMessage(notification);
      // Show local notification for foreground messages on Android
      if (title.isNotEmpty || body.isNotEmpty) {
        flutterLocalNotificationsPlugin.show(
          random.nextInt(100000),
          title,
          body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              _channelId,
              _channelName,
              importance: Importance.max,
              priority: Priority.high,
              icon: appIcon,
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      delegate.onMessageOpenedApp(FCMNotificationItem(
        id: message.messageId ?? '',
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        additionalData: message.data,
        date: DateTime.now(),
      ));
    });
    // Background handler is registered in main.dart before runApp
  }

  void disableNotification() {
    _instance.unsubscribeFromTopic(_topicAllDevices);
  }

  void enableNotification() {
    _instance.subscribeToTopic(_topicAllDevices);
  }

  Future onSelectNotification(String? payload) async {
    final notification = FCMNotificationItem(
      additionalData: Map<String, dynamic>.from(jsonDecode(payload ?? '')),
      body: '',
      id: '',
      title: '',
      date: null,
    );
    print(notification);
  }
}
