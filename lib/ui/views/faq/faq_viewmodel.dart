import 'package:example/models/faq.dart';
import 'package:example/ui/index.dart';
import 'package:stacked/stacked.dart';

class FaqViewModel extends BaseViewModel {
  final _commonService = locator<CommonService>();

  List<FaqModel> faqs = [];

  Future getFaqs() async {
    try {
      showLoading();
      final result = await _commonService.getFaq();
      result.fold(
        (error) => debugPrint('getFaq failed: ${error.message}'),
        (result) {
          faqs = result.data;
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
}
