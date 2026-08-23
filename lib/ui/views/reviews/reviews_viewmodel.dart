import 'package:example/models/rate.dart';
import 'package:example/services/rate_service.dart';
import 'package:example/ui/index.dart';

class ReviewsViewModel extends BaseViewModel {
  final _rateService = locator<RateService>();
  final _preferenceService = locator<PreferencesService>();

  List<RateModel> rates = [];

  Future getRate() async {
    try {
      showLoading();
      setBusy(true);
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
      setBusy(false);
      hideLoading();
    }
  }
}
