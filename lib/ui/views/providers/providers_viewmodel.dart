import 'package:example/models/provider.dart';
import 'package:example/services/common_service.dart';
import 'package:example/ui/index.dart';

class ProvidersViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _commonService = locator<CommonService>();

  List<ProviderModel> providers = [];

  void navigateToProvidersView(ProviderModel data) {
    _navigationService.navigateToProviderDetailsView(data: data);
  }

  Future getProviders({String? text}) async {
    try {
      showLoading();
      setBusy(true);
      final result = await _commonService.getProviders(name: text);
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
      setBusy(false);
      hideLoading();
    }
  }
}
