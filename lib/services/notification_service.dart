import 'package:awesome_dialog/awesome_dialog.dart' as dialogAwesome;
import 'package:example/models/fcm_notification.dart';
import 'package:example/ui/index.dart';

// import 'package:notification_permissions/notification_permissions.dart';

class NotificationService {
  NotificationService();

  late final NotificationDelegate delegate;
  final _nav = locator<NavigationService>();

  Future<bool> requestPermission() async {
    // final status = await NotificationPermissions.requestNotificationPermissions(
    //   iosSettings: const NotificationSettingsIos(
    //     sound: true,
    //     badge: true,
    //     alert: true,
    //   ),
    // );
    // if (status == PermissionStatus.granted) {
    return true;
    // } else {
    //   return false;
    // }
  }

  Future<bool> isGranted(BuildContext context) async {
    // final status =
    //     await NotificationPermissions.getNotificationPermissionStatus();
    // print('status< $status');
    // if (status == PermissionStatus.granted) {
    //   return true;
    // } else if (status == PermissionStatus.denied) {
    //   dialogAwesome.AwesomeDialog(
    //           context: context,
    //           dialogType: dialogAwesome.DialogType.NO_HEADER,
    //           headerAnimationLoop: false,
    //           animType: dialogAwesome.AnimType.BOTTOMSLIDE,
    //           buttonsTextStyle: const TextStyle(color: Colors.white),
    //           showCloseIcon: false,
    //           btnCancelOnPress: () {
    //             _nav.back();
    //           },
    //           btnOkOnPress: () {
    //             requestPermission();
    //           },
    //           body: Column(
    //             children: [
    //               const CircleAvatar(
    //                 child: Icon(Icons.notifications,
    //                     color: Colors.white, size: 30),
    //                 backgroundColor: kcPrimaryColor,
    //                 minRadius: 35,
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(5.0),
    //                 child: Text(translate('notification_closed'),
    //                     style: const TextStyle(
    //                         fontWeight: FontWeight.bold, fontSize: 16)),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.all(5.0),
    //                 child: Text(translate('please_enable_setting'),
    //                     style: const TextStyle(fontSize: 14),
    //                     textAlign: TextAlign.center),
    //               )
    //             ],
    //           ),
    //           btnCancelText: translate('later'),
    //           btnOkText: translate('go_to_setting'),
    //           btnCancelColor: Colors.grey,
    //           btnOkColor: kcPrimaryColor)
    //       .show();
    //   return false;
    // } else {
    return false;
    // }
  }
}

mixin NotificationDelegate {
  void onTapMessage(FCMNotificationItem notification);

  void onMessage(FCMNotificationItem notification);

  void onMessageOpenedApp(FCMNotificationItem notification);
}
