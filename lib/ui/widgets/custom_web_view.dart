import 'dart:convert';
import 'package:example/ui/index.dart';
import 'package:html/parser.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WebViewCustom extends StatefulWidget {
  final String url;
  const WebViewCustom({super.key, required this.url});

  @override
  State<WebViewCustom> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewCustom> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // #docregion platform_features
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Color.fromRGBO(0, 0, 0, 0))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) async {
            debugPrint('Page finished loading: $url');
            debugPrint('Page finished loading: ${url.contains('oauth_token')}');
            final _navigationService = locator<NavigationService>();

            if (url.contains('oauth_verifier')) {
              try {
                final html = await _controller.runJavaScriptReturningResult(
                    'document.documentElement.outerHTML');
                final decodedHtml = json.decode(html.toString());
                final document = parse(decodedHtml);
                final bodyElement = document.querySelector('body');
                if (bodyElement != null) {
                  String bodyContent = bodyElement.innerHtml;
                  final token = bodyContent.split('<link').first;
                  print('token > ${token}');
                  _navigationService.back(result: token.toString());
                } else {
                  print('No <body> tag found in the HTML content.');
                  _navigationService.back(result: null);
                }
              } catch (e) {
                print('Error: $e');
                _navigationService.back(result: null);
              }
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kcPrimaryColor,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
