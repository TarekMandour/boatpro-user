import 'dart:developer';
import '../ui/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String selectedLocaleKey = 'selected_locale';

class TranslateService implements ITranslatePreferences {
  @override
  Future<Locale?> getPreferredLocale() async {
    final preferences = await SharedPreferences.getInstance();

    if (!preferences.containsKey(selectedLocaleKey)) return null;

    var locale = preferences.getString(selectedLocaleKey);

    log('$locale', name: 'Localization now');

    return localeFromString(locale!);
  }

  @override
  Future savePreferredLocale(Locale locale) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString(selectedLocaleKey, localeToString(locale));
  }
}
