import 'dart:developer';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../ui/index.dart';

const Duration defaultTimeout = Duration(seconds: 15);
const Duration connectTimeout = Duration(seconds: 10);
const String contentType = 'content-type';
const String accpet = 'accept';
const String authorization = 'X-Authorization';
const String applicationJson = 'application/json';
const String bearer = 'Bearer';
const String acceptLang = 'Language';

class DioFactory {
  static Dio? _dio;

  static Dio? get instance {
    if (_dio == null) {
      _dio = Dio();

      _dio?.options.connectTimeout = connectTimeout;
      _dio?.options.receiveTimeout = defaultTimeout;
      _dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        request: true,
      ));
      _dio?.interceptors.add(
        InterceptorsWrapper(
          onError: (DioException e, handler) async {
            hideLoading();
            final prefService = locator<PreferencesService>();
            final navigationService = locator<NavigationService>();
            if (prefService.userData != null) {
              if (e.response?.statusCode == 401) {
                prefService.clearCachedUser();
                navigationService.clearStackAndShow(Routes.loginView);
              }
            }
            return handler.next(e);
          },
        ),
      );
    }
    return _dio;
  }

  static Future<Map<String, String>> getHeader() async {
    final _prefService = locator<PreferencesService>();
    String _token = await _prefService.getCachedToken();
    String? lang = await _prefService.getLanguageLocale();

    log(_token);
    Map<String, String> headers = {
      contentType: applicationJson,
      accpet: applicationJson,
      acceptLang: lang ?? 'en',
      if (_token.isNotEmpty)
        authorization: _token.isEmpty ? '' : '$bearer $_token',
    };
    return headers;
  }

  static Future<Response<T>?> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final _prefService = locator<PreferencesService>();
    String _guestToken = await _prefService.getCachedGuestToken();

    instance?.options.headers = await getHeader();
    return instance?.get<T>(path,
        queryParameters: _guestToken.isNotEmpty
            ? queryParameters?.putIfAbsent(
                '',
                () => {'VisitorId': _guestToken},
              )
            : queryParameters);
  }

  static Future<Response<T>?> post<T>(String path, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    final _prefService = locator<PreferencesService>();
    String _guestToken = await _prefService.getCachedGuestToken();

    instance?.options.headers = await getHeader();
    return instance?.post<T>(path,
        data: data,
        queryParameters: _guestToken.isNotEmpty
            ? queryParameters?.putIfAbsent(
                '',
                () => {'VisitorId': _guestToken},
              )
            : queryParameters);
  }

  static Future<Response<T>?> patch<T>(String path, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    instance?.options.headers = await getHeader();
    return instance?.patch<T>(path,
        data: data, queryParameters: queryParameters);
  }

  static Future<Response<T>?> put<T>(String path, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    instance?.options.headers = await getHeader();
    return instance?.put<T>(path, data: data, queryParameters: queryParameters);
  }

  static Future<Response<T>?> delete<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    instance?.options.headers = await getHeader();
    return instance?.delete<T>(path, queryParameters: queryParameters);
  }
}
