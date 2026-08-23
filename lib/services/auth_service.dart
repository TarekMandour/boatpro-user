import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:example/models/user.dart';
import 'package:example/ui/index.dart';

class AuthService {
  Future<Either<Failure, BaseDataResponse<UserData>>> login({
    required String email,
    required String password,
    required String fcmToken,
  }) async {
    try {
      Map<String, String> data = {
        Url.emailKey: email,
        Url.passwordKey: password,
        Url.fcmTokenKey: fcmToken,
        'role': 'user',
      };
      final formData = FormData.fromMap(data);
      final response =
          await DioFactory.post(Url.baseUrl + Url.auth + Url.login, formData);
      final result = BaseDataResponse.fromJson(
          response?.data, (json) => UserData.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, BaseDataResponse>> checkPhone({
    required String phone,
    required int exist,
  }) async {
    try {
      Map<String, dynamic> data = {
        Url.phoneKey: phone,
        Url.existKey: exist,
      };
      final formData = FormData.fromMap(data);
      final response = await DioFactory.post(
          Url.baseUrl + Url.auth + Url.checkPhone, formData);
      final result = BaseDataResponse.fromJson(response?.data, (json) => json);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, BaseDataResponse>> checkEmail({
    required String email,
    required int exist,
  }) async {
    try {
      Map<String, dynamic> data = {
        Url.emailKey: email,
        Url.existKey: exist,
      };
      final formData = FormData.fromMap(data);
      final response = await DioFactory.post(
          Url.baseUrl + Url.auth + Url.checkEmail, formData);
      final result = BaseDataResponse.fromJson(response?.data, (json) => json);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse>> checkVerification({
    required String phone,
    required String code,
  }) async {
    try {
      Map<String, String> data = {
        Url.emailKey: phone,
        Url.codeKey: code,
      };
      final formData = FormData.fromMap(data);
      final response = await DioFactory.post(
          Url.baseUrl + Url.auth + Url.checkVerification, formData);
      final result = ListResponse.fromJson(response?.data, (json) => json);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, BaseDataResponse<UserData>>> register({
    required String phone,
    required String email,
    required String name,
    required String password,
    required String photo,
    required String role,
  }) async {
    try {
      Map<String, String> data = {
        Url.phoneKey: phone,
        Url.emailKey: email,
        Url.nameKey: name,
        Url.passwordKey: password,
        Url.photoKey: photo,
        Url.roleKey: role,
      };
      final formData = FormData.fromMap(data);
      final response = await DioFactory.post(
          Url.baseUrl + Url.auth + Url.register, formData);
      final result = BaseDataResponse.fromJson(
          response?.data, (json) => UserData.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, BaseDataResponse<UserData>>> updateProfile({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      Map<String, String> data = {
        Url.emailKey: email,
        Url.nameKey: name,
        Url.passwordKey: password,
        "gender": "male",
      };
      final formData = FormData.fromMap(data);
      final response = await DioFactory.post(
          Url.baseUrl + Url.auth + Url.updateProfile, formData);
      final result = BaseDataResponse.fromJson(
          response?.data, (json) => UserData.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse>> updatePassword({
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      Map<String, String> data = {
        Url.phoneKey: phone,
        Url.passwordKey: password,
        Url.passwordConfirmationKey: passwordConfirmation,
      };
      final formData = FormData.fromMap(data);
      final response = await DioFactory.post(
          Url.baseUrl + Url.auth + Url.updatePassword, formData);
      final result = ListResponse.fromJson(response?.data, (json) => json);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, BaseDataResponse>> logout() async {
    try {
      final response =
          await DioFactory.post(Url.baseUrl + Url.auth + Url.logout, null);
      final result = BaseDataResponse.fromJson(response?.data, (json) => json);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, BaseDataResponse<UserData>>> getProfile() async {
    try {
      final response =
          await DioFactory.get(Url.baseUrl + Url.auth + Url.profile);
      final result = BaseDataResponse.fromJson(
          response?.data, (json) => UserData.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, BaseDataResponse<UserData>>> updateImage(
      File image) async {
    try {
      String imageName = image.path.split('/').last;

      Map<String, dynamic> data = {
        Url.imageKey:
            await MultipartFile.fromFile(image.path, filename: imageName),
      };
      final formData = FormData.fromMap(data);
      final response = await DioFactory.post(
          Url.baseUrl + Url.auth + Url.updateUserImage, formData);
      final result = BaseDataResponse.fromJson(
          response?.data, (json) => UserData.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }
}
