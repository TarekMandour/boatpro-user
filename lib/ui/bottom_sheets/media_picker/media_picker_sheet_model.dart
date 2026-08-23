import 'dart:io';

import 'package:example/ui/index.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

class MediaPickerSheetModel extends BaseViewModel {
  File? image;
  File? video;
  File? document;
  ImagePicker picker = ImagePicker();

  Future pickImage({required Function() callBack}) async {
    try {
      // showLoading();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final pickImage = await imageCompressAndGetFile(File(pickedFile.path));
        print('size image before> ${await pickedFile.length()}');
        image = pickImage;
        print('size image compress > ${await image?.length()}');
        double sizeInMb = await Helper().getFileSizeInMB(image);
        print('sizeInMb > $sizeInMb');
        // if (sizeInMb <= 5) {
        //   await callBack();
        // } else {
        //   print('BIGGER ');
        //   // _dialogService.showCustomSnackBar(
        //   //   variant: SnackbarType.error,
        //   //   message: translate(ErrorMessages.maxSizeImage),
        //   //   duration: const Duration(seconds: 2),
        //   // );
        //   notifyListeners();
        // }
        // hideLoading();
      } else {
        print('No image selected.');
        notifyListeners();
      }
    } on PlatformException catch (e) {
      // Handle the error
      // _dialogService.showCustomSnackBar(
      //   variant: SnackbarType.error,
      //   message: e.message.toString(),
      //   duration: const Duration(seconds: 2),
      // );
      notifyListeners();
    } finally {}
  }

  Future pickVideo({required Function() callBack}) async {
    try {
      // showLoading();
      final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
      if (pickedFile != null) {
        final pickVideo = File(pickedFile.path);
        print('size video before> ${await pickedFile.length()}');
        video = await videoCompressAndGetFile(pickVideo);
        print('size video compress > ${await video?.length()}');
        double sizeInMb = await Helper().getFileSizeInMB(video);
        print('sizeInMb > $sizeInMb');
        // if (sizeInMb <= 30) {
        //   await callBack();
        // } else {
        //   print('BIGGER ');
        //   _dialogService.showCustomSnackBar(
        //     variant: SnackbarType.error,
        //     message: translate(ErrorMessages.maxSizeVideo),
        //     duration: const Duration(seconds: 2),
        //   );
        //   notifyListeners();
        // }
      } else {
        print('No video selected.');
        notifyListeners();
      }
    } on PlatformException catch (e) {
      // Handle the error
      // _dialogService.showCustomSnackBar(
      //   variant: SnackbarType.error,
      //   message: e.message.toString(),
      //   duration: const Duration(seconds: 2),
      // );
      notifyListeners();
    } finally {}
  }

  Future pickDocument({required Function() callBack}) async {
    try {
      // showLoading();
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        final pickDocument = File(result.files.single.path ?? '');
        document = pickDocument;
        double sizeInMb = await Helper().getFileSizeInMB(document);
        print('sizeInMb > $sizeInMb');
        // if (sizeInMb <= 10) {
        //   await callBack();
        // } else {
        //   print('BIGGER ');
        //   _dialogService.showCustomSnackBar(
        //     variant: SnackbarType.error,
        //     message: translate(ErrorMessages.maxSizeDocument),
        //     duration: const Duration(seconds: 2),
        //   );
        //   notifyListeners();
        // }
      } else {
        print('No document selected.');
        notifyListeners();
      }
    } on PlatformException catch (e) {
      // Handle the error
      // _dialogService.showCustomSnackBar(
      //   variant: SnackbarType.error,
      //   message: e.message.toString(),
      //   duration: const Duration(seconds: 2),
      // );
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

  Future<File?> videoCompressAndGetFile(File? file) async {
    if (file == null) {
      // Handle the case when compressedData is null
      throw Exception("File data is null.");
    }
    MediaInfo? mediaInfo = await VideoCompress.compressVideo(
      file.path,
      quality: VideoQuality.DefaultQuality,
    );

    return mediaInfo?.file;
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
