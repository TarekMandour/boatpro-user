import 'package:example/models/banner.dart';
import 'package:example/models/country.dart';
import 'package:example/models/fcm_notification.dart';
import 'package:example/models/provider.dart';
import 'package:example/services/fcm_service.dart';
import 'package:example/services/notification_service.dart';
import 'package:example/ui/index.dart';
import 'package:example/ui/views/home/home_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/geocoding.dart';

class HomeViewModel extends BaseViewModel implements NotificationDelegate {
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _commonService = locator<CommonService>();
  final _favouriteService = locator<FavouriteService>();

  String? currentAddress;

  List<ProviderModel> providers = [];
  List<YachtModel> yachts = [];
  List<BannerModel> banners = [];
  List<TypeModel> categories = [
    TypeModel(id: 1, name: 'yacht'),
    TypeModel(id: 2, name: 'boat'),
    TypeModel(id: 3, name: 'jet-ski'),
  ];
  List<CountryModel> countries = [];
  TypeModel? selectedCategory;
  CountryModel? selectedCountry;
  String? locationAdress;

  Future init() async {
    showLoading();
    setBusy(true);
    try {
      await Future.wait([
        getBanners(),
        getProviders(),
        getYachts(),
        getCountries(),
      ]);
    } catch (e) {
      debugPrint('init error: $e');
    } finally {
      setBusy(false);
      hideLoading();
    }
  }

  final _dialogService = locator<DialogService>();
  bool _locationHandled = false;

  Future loadLocation() async {
    if (_locationHandled) return;
    _locationHandled = true;

    // Only show the disclosure dialog once ever
    final prefs = await SharedPreferences.getInstance();
    final alreadyShown = prefs.getBool('location_dialog_shown') ?? false;

    if (!alreadyShown) {
      final response = await _dialogService.showDialog(
        title: 'طلب تحديد موقعك على الخريطة',
        description:
        "يستخدم التطبيق موقعك الجغرافي لتحديد موقعك الحالي على الخريطة وعرض أقرب مزودي الخدمة المتاحين بالقرب منك.يتم استخدام موقعك فقط أثناء استخدام التطبيق، ولا يتم تتبع موقعك في الخلفية أو بعد إغلاق التطبيق.لا يتم تخزين موقعك أو مشاركته مع أي طرف ثالث.",
        buttonTitle: 'متابعه',
        cancelTitle: 'ليس الان',
      );

      if (response?.confirmed != true) return;
      await prefs.setBool('location_dialog_shown', true);
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    currentAddress = await GeocodingService.getCurrentLocation();

    notifyListeners();
  }

  Future<bool> showLocationDisclosure(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text("طلب تحديد موقعك على الخريطة"),
          content: Text(
              "يستخدم التطبيق موقعك الجغرافي لتحديد موقعك الحالي على الخريطة وعرض أقرب مزودي الخدمة المتاحين بالقرب منك.يتم استخدام موقعك فقط أثناء استخدام التطبيق، ولا يتم تتبع موقعك في الخلفية أو بعد إغلاق التطبيق.لا يتم تخزين موقعك أو مشاركته مع أي طرف ثالث."
          ),
          actions: [
            TextButton(
              child: Text("ليس الان"),
              onPressed: () {
                Navigator.of(dialogContext).pop(false);
              },
            ),
            TextButton(
              child: Text("اوافق"),
              onPressed: () {
                Navigator.of(dialogContext).pop(true);
              },
            ),
          ],
        );
      },
    );

    return result ?? false;
  }

  void updateCategory(TypeModel value) {
    selectedCategory = value;
    notifyListeners();
  }

  void updateCountries(CountryModel value) {
    selectedCountry = value;
    notifyListeners();
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: AppStrings.ksLoremTitle,
      description: AppStrings.ksLoremDescription,
    );
  }

  void navigateToProvidersView() {
    _navigationService.navigateToProvidersView();
  }

  void navigateToTopYachtsView() {
    _navigationService.navigateToTopYachtsView();
  }

  void navigateToMapView() {
    _navigationService.navigateToMapView();
  }

  void navigateToYachtsView() {
    _navigationService.navigateToYachtsView(
        countryId: selectedCountry?.id.toString() ?? '',
        serviceId: selectedCategory?.id.toString() ?? '');
  }

  void navigateToProviderDetailsView(ProviderModel data) {
    _navigationService.navigateToProviderDetailsView(data: data);
  }

  void navigateToNotificationsView() {
    _navigationService.navigateToNotificationsView();
  }

  Future getCountries() async {
    try {
      final result = await _commonService.getCountries();
      result.fold(
        (error) => debugPrint('getCountries failed: \${error.message}'),
        (result) {
          countries = result.data;
          notifyListeners();
        },
      );
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future getBanners() async {
    try {
      // showLoading();
      final result = await _commonService.getBanners();
      result.fold(
        (error) => debugPrint('getBanners failed: ${error.message}'),
        (result) {
          banners = result.data;
          notifyListeners();
        },
      );
    } catch (e) {
      // Handle the error
      debugPrint('Error: $e');
    } finally {
      // hideLoading();
    }
  }

  Future getProviders() async {
    try {
      // showLoading();
      final result = await _commonService.getProviders(limit: '2');
      result.fold(
        (error) => debugPrint('getProviders failed: ${error.message}'),
        (result) {
          providers = result.data;
          notifyListeners();
        },
      );
    } catch (e) {
      // Handle the error
      debugPrint('Error: $e');
    } finally {
      // hideLoading();
    }
  }

  Future getYachts() async {
    try {
      // showLoading();
      final result = await _commonService.getYachts(limit: '5', sortBy: 'top');
      result.fold(
        (error) => debugPrint('getYachts failed: ${error.message}'),
        (result) {
          yachts = result.data;
          notifyListeners();
        },
      );
    } catch (e) {
      // Handle the error
      debugPrint('Error: $e');
    } finally {
      // hideLoading();
    }
  }

  Future addFavourite(YachtModel yacht) async {
    try {
      showLoading();
      final result =
          await _favouriteService.addFavourite(yachtId: yacht.id.toString());
      result.fold(
        (error) => debugPrint('addFavourite failed: ${error.message}'),
        (result) {
          yacht.isFav = !(yacht.isFav ?? false);
          notifyListeners();
        },
      );
    } catch (e) {
      // Handle the error
      debugPrint('Error: $e');
    } finally {
      hideLoading();
    }
  }

  Future initFCM() async {
    // Run FCM init in background — don't block the home screen
    Future.microtask(() async {
      try {
        final notificationService = FcmService();
        await notificationService
            .isGranted(StackedService.navigatorKey!.currentState!.context);
        await notificationService.init(notificationDelegate: this);
        notificationService.enableNotification();
        debugPrint('[AppState] Register Firebase');
      } catch (e) {
        debugPrint('[FCM] init error: $e');
      }
    });
  }

  @override
  void onMessage(FCMNotificationItem notification) {
    debugPrint('onMessage > ${notification.toJson()}');
  }

  @override
  void onMessageOpenedApp(FCMNotificationItem notification) {
    debugPrint('onMessageOpenedApp > ${notification.toJson()}');
  }

  @override
  void onTapMessage(FCMNotificationItem notification) {
    debugPrint('onTapMessage > ${notification.toJson()}');
  }
}
