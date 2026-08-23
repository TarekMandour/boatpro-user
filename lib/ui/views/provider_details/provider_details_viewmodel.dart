import 'package:example/models/rate.dart';
import 'package:example/models/yacht.dart';
import 'package:example/services/common_service.dart';
import 'package:example/services/favourite_service.dart';
import 'package:example/services/rate_service.dart';
import 'package:example/ui/index.dart';

class ProviderDetailsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _commonService = locator<CommonService>();
  final _rateService = locator<RateService>();
  final _favouriteService = locator<FavouriteService>();
  final _preferenceService = locator<PreferencesService>();

  List<YachtModel> yachts = [];
  List<RateModel> rates = [];

  Future init(id) async {
    setBusy(true);
    await Future.wait([
      getYachts(id),
      getRate(id),
    ]);
    setBusy(false);
  }

  Future getYachts(providerId) async {
    try {
      showLoading();
      final result =
          await _commonService.getYachts(providerId: providerId.toString());
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
      hideLoading();
    }
  }

  Future getRate(providerId) async {
    try {
      showLoading();
      final result = await _rateService.getRate(
          type: 'User', typeId: _preferenceService.userData?.id.toString());
      result.fold(
        (error) => debugPrint('getRate failed: ${error.message}'),
        (result) {
          rates = result.data;
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

  Future addFavourite(String providerId, String yachtId) async {
    try {
      showLoading();
      final result = await _favouriteService.addFavourite(yachtId: yachtId);
      result.fold(
        (error) => debugPrint('addFavourite failed: ${error.message}'),
        (result) {
          init(providerId);
        },
      );
    } catch (e) {
      // Handle the error
      debugPrint('Error: $e');
    } finally {
      hideLoading();
    }
  }
}
