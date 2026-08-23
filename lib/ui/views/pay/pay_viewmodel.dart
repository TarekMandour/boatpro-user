import 'package:example/ui/index.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PayViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  late final WebViewController controller;

  init(url) {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
            setBusy(true);
            if (progress == 100) setBusy(false);
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) async {
            debugPrint('Page finished loading: $url');
            if (url.contains('Successful')) {
              _navigationService.back(result: true);
            }
            if (url.contains('Failure')) {
              _navigationService.back(result: false);
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
    notifyListeners();
  }
}
