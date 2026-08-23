import 'package:example/ui/index.dart';
import 'package:stacked/stacked.dart';

class LanguageSheetModel extends BaseViewModel {
  LanguageType languageModel = LanguageType.english;

  void init() {
    var localizationDelegate =
        LocalizedApp.of(StackedService.navigatorKey!.currentContext!).delegate;
    var lang = localizationDelegate.currentLocale.languageCode;
    if (lang == AppStrings.en) {
      languageModel = LanguageType.english;
    } else if (lang == AppStrings.ar) {
      languageModel = LanguageType.arabic;
    }
  }

  void changeLanguageValue(lang) {
    languageModel = lang;
    notifyListeners();
  }

  Widget checkRadioButtonLanguage(lang) {
    if (languageModel == lang) {
      return const Icon(Icons.radio_button_on, color: kcPrimaryColor);
    } else {
      return const Icon(Icons.radio_button_off);
    }
  }

  void changeLanguage(
      {required BuildContext context, required LanguageType lang}) {
    if (lang == LanguageType.english) {
      changeLocale(context, AppStrings.en);
    }
    if (lang == LanguageType.arabic) {
      changeLocale(context, AppStrings.ar);
    }
  }
}

enum LanguageType {
  english,
  arabic,
}
