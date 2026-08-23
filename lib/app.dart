import 'ui/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart' as flc;

class MyApp extends StatelessWidget {
  final botToastBuilder = BotToastInit();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        title: AppStrings.ksAppName,
        debugShowCheckedModeBanner: false,
        theme: Theme.of(context).copyWith(
          primaryColor: kcPrimaryColor,
          focusColor: kcPrimaryColor,
          useMaterial3: false,
          textTheme: GoogleFonts.fredokaTextTheme(),
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: kcPrimaryColor)),
        ),
        initialRoute: Routes.startupView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          localizationDelegate,
          flc.CountryLocalizations.delegate,
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        navigatorObservers: [
          StackedService.routeObserver,
          BotToastNavigatorObserver(),
        ],
        builder: (context, child) {
          child = botToastBuilder(context, child);
          return child;
        },
      ),
    );
  }
}
