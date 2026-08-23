import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'services/fcm_service.dart';

import 'app.dart';
import 'ui/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Register background handler before runApp
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // Create notification channel early so background/terminated notifications work
  const androidChannel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.max,
  );
  final plugin = FlutterLocalNotificationsPlugin();
  await plugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(androidChannel);

  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  setupSnackbarUi();

  // Flutter translate
  var delegate = await LocalizationDelegate.create(
      fallbackLocale: 'en',
      preferences: TranslateService(),
      supportedLocales: ['en', 'ar']);

  return runApp(LocalizedApp(delegate, MyApp()));
}
