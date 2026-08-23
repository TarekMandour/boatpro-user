import 'dart:io';

import 'package:example/models/page.dart';
import 'package:example/services/auth_service.dart';
import 'package:example/ui/index.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfileViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final preferencesService = locator<PreferencesService>();
  final _commonService = locator<CommonService>();
  final _authService = locator<AuthService>();

  List<PageModel> pages = [];

  File? image;

  ImagePicker picker = ImagePicker();

  void navigateToSettingsView() async {
    await _navigationService
        .navigateToSettingsView()
        .then((value) async {
      await getPages();
      notifyListeners();
    });
  }

  void navigateToFaqView() {
    _navigationService.navigateToFaqView();
  }

  void navigateToNotificationsView() {
    if (checkRouteToLogin()) {
      _navigationService.navigateToNotificationsView();
    }
  }

  void navigateToPagesView(String title, String body) {
    _navigationService.navigateToPagesView(title: title, body: body);
  }

  void navigateToContactusView() {
    _navigationService.navigateToContactusView();
  }

  void navigateToReviewsView() {
    if (checkRouteToLogin()) {
      _navigationService.navigateToReviewsView();
    }
  }

  void navigateToSavedView() {
    if (checkRouteToLogin()) {
      _navigationService.navigateToSavedView();
    }
  }

  bool checkRouteToLogin() {
    if (preferencesService.userData == null) {
      _navigationService.navigateToLoginView();
      return false;
    } else {
      return true;
    }
  }

  Future getPages() async {
    try {
      showLoading();
      final result = await _commonService.getPages();
      result.fold(
        (error) => debugPrint('getPages failed: ${error.message}'),
        (result) {
          pages = result.data;
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

  Future logout() async {
    try {
      showLoading();
      await _authService.logout();
    } catch (e) {
      debugPrint('logout error: $e');
    } finally {
      // Always clear local data and navigate to login
      preferencesService.clearCachedUser();
      hideLoading();
      _navigationService.clearStackAndShow(Routes.loginView);
    }
  }

  Future updateImage() async {
    try {
      showLoading();
      final result = await _authService.updateImage(image!);
      result.fold(
        (error) => debugPrint('updateImage failed: ${error.message}'),
        (result) {
          preferencesService.setCacheUserData(
              user: result.data, isUpdateToken: false);
        },
      );
    } catch (e) {
      // Handle the error
      debugPrint('Error: $e');
    } finally {
      hideLoading();
    }
  }

  Future pickImage() async {
    try {
      // showLoading();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final pickImage = await imageCompressAndGetFile(File(pickedFile.path));
        image = pickImage;
        await updateImage();
        notifyListeners();
      } else {
        print('No image selected.');
        notifyListeners();
      }
    } on PlatformException catch (_) {
      // Handle the error

      notifyListeners();
    } finally {}
  }

  Future<File?> imageCompressAndGetFile(File? file) async {
    if (file == null) {
      // Handle the case when compressedData is null
      throw Exception("File data is null.");
    }
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      quality: 95,
    );
    File compressedFile = await convertUint8ListToFile(result);
    return compressedFile;
  }

  Future<File> convertUint8ListToFile(Uint8List? compressedData) async {
    if (compressedData == null) {
      // Handle the case when compressedData is null
      throw Exception("Compressed data is null.");
    }
    String tempDir = (await getTemporaryDirectory()).path;
    File tempFile = File('$tempDir/image_compress.jpg');
    await tempFile.writeAsBytes(compressedData);
    return tempFile;
  }
}
