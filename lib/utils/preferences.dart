import 'package:example/models/login.dart';
import 'package:example/models/user.dart';
import 'package:example/ui/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  SharedPreferences? _preferences;
  UserData? userData;

  Future<SharedPreferences?> get preferences async {
    if (_preferences != null) {
      return _preferences;
    }
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  Future<String?> getLanguageLocale() async {
    final prefs = await preferences;
    String? locale = prefs?.getString(selectedLocaleKey);
    return locale;
  }

  Future<void> setCacheToken(String token) async {
    final prefs = await preferences;
    prefs?.setString('token', token);
  }

  Future<void> setCacheUserData(
      {required UserData user, bool isUpdateToken = false}) async {
    // await clearCachedUser();
    final prefs = await preferences;
    prefs?.setString('id', (user.id ?? 0).toString());
    prefs?.setString('name', user.name.toString());
    prefs?.setString('phone', user.phone.toString());
    prefs?.setString('email', user.email.toString());
    prefs?.setString('image', user.image.toString());
    if (isUpdateToken) prefs?.setString('token', user.token ?? '');
    prefs?.setString('fcm_token', user.fcmToken ?? '');
    userData = UserData(
      id: user.id,
      name: user.name,
      phone: user.phone,
      email: user.email,
      image: user.image,
      token: user.token,
      fcmToken: user.fcmToken,
    );
  }

  Future<UserData?> getCachedUserData() async {
    // await clearCachedUser();
    final prefs = await preferences;
    final id = prefs?.get('id').toString();
    final name = prefs?.getString('name');
    final phone = prefs?.getString('phone');
    final email = prefs?.getString('email');
    final image = prefs?.getString('image');
    final token = prefs?.getString('token');
    final fcmToken = prefs?.getString('fcm_token');
    if (id != null && phone != null && token != null) {
      userData = UserData(
        id: int.parse(id ?? '0'),
        name: name,
        phone: phone,
        email: email ?? '',
        image: image ?? '',
        token: token,
        fcmToken: fcmToken,
      );
      return userData;
    } else {
      return null;
    }
  }

  Future<String> getCachedToken() async {
    final prefs = await preferences;
    final token = prefs?.getString('token');
    if (token != null && token.isNotEmpty) {
      return token;
    }
    return '';
  }

  Future<String> getCachedGuestToken() async {
    final prefs = await preferences;
    final token = prefs?.getString('guestToken');
    if (token != null && token.isNotEmpty) {
      return token;
    }
    return '';
  }

  // Future<bool> getIsGuest() async {
  //   final prefs = await preferences;
  //   final token = prefs?.getBool('isGuest');
  //   if (token != null) {
  //     return token;
  //   }
  //   return false;
  // }

  Future<void> clearCachedUser() async {
    final prefs = await preferences;
    prefs?.remove('id');
    prefs?.remove('phone');
    prefs?.remove('email');
    prefs?.remove('image');
    prefs?.remove('token');
    prefs?.remove('isGuest');
    prefs?.remove('guestToken');
    userData = null;
    print(prefs?.getKeys());
  }

  Future<void> setFCMToken(String? token) async {
    final prefs = await preferences;
    if (token != null && token.isNotEmpty) {
      prefs?.setString('fcmToken', token);
    }
  }

  Future<String> getFCMToken() async {
    final prefs = await preferences;
    final token = prefs?.getString('fcmToken');
    if (token != null && token.isNotEmpty) {
      return token;
    }
    return '';
  }
}
