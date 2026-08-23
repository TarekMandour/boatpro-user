import 'package:dartz/dartz.dart';
import 'package:example/models/banner.dart';
import 'package:example/models/country.dart';
import 'package:example/models/date.dart';
import 'package:example/models/faq.dart';
import 'package:example/models/notifications.dart';
import 'package:example/models/page.dart';
import 'package:example/models/provider.dart';
import 'package:example/models/setting.dart';
import 'package:example/models/time.dart';
import 'package:example/models/yacht.dart';
import 'package:example/ui/index.dart';

class CommonService {
  Future<Either<Failure, ListResponse<CountryModel>>> getCountries() async {
    try {
      final response = await DioFactory.get(Url.baseUrl + Url.countries);
      final result = ListResponse.fromJson(
          response?.data, (json) => CountryModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse<BannerModel>>> getBanners() async {
    try {
      final response = await DioFactory.get(Url.baseUrl + Url.banners);
      final result = ListResponse.fromJson(
          response?.data, (json) => BannerModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse<ProviderModel>>> getProviders({
    final String? limit,
    final String? name,
  }) async {
    try {
      Map<String, String> data = {
        if (limit != null) Url.limitKey: limit.toString(),
        if (name != null) Url.nameKey: name.toString(),
      };
      final response = await DioFactory.get(Url.baseUrl + Url.providers,
          queryParameters: data);
      final result = ListResponse<ProviderModel>.fromJson(
          response?.data, (json) => ProviderModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse<YachtModel>>> getYachts({
    final String? limit,
    final String? sortBy,
    final String? name,
    final String? providerId,
    final String? countryId,
    final String? serviceId,
  }) async {
    try {
      Map<String, String> data = {
        if (limit != null) Url.limitKey: limit.toString(),
        if (sortBy != null) Url.sortByKey: sortBy.toString(),
        if (name != null) Url.nameKey: name.toString(),
        if (providerId != null) Url.providerIdKey: providerId.toString(),
        if (serviceId != null) Url.serviceType: serviceId.toString(),
        if (countryId != null) Url.countryId: countryId.toString(),
      };
      final response =
          await DioFactory.get(Url.baseUrl + Url.yachts, queryParameters: data);
      final result = ListResponse<YachtModel>.fromJson(
          response?.data, (json) => YachtModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, BaseDataResponse>> sendContactUs({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String message,
  }) async {
    try {
      Map<String, String> data = {
        Url.firstNameKey: firstName,
        Url.lastNameKey: lastName,
        Url.phoneKey: phone,
        Url.emailKey: email,
        Url.messageKey: message,
      };
      final formData = FormData.fromMap(data);
      final response =
          await DioFactory.post(Url.baseUrl + Url.contactUs, formData);
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

  Future<Either<Failure, ListResponse<PageModel>>> getPages() async {
    try {
      final response = await DioFactory.get(Url.baseUrl + Url.pages);
      final result = ListResponse.fromJson(
          response?.data, (json) => PageModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse<FaqModel>>> getFaq() async {
    try {
      final response = await DioFactory.get(Url.baseUrl + Url.faqs);
      final result = ListResponse.fromJson(
          response?.data, (json) => FaqModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse<NotificationModel>>>
      getNotification() async {
    try {
      final response =
          await DioFactory.get(Url.baseUrl + Url.user + Url.notifications);
      final result = ListResponse.fromJson(
          response?.data, (json) => NotificationModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse<SettingModel>>> getSettings() async {
    try {
      final response = await DioFactory.get(Url.baseUrl + Url.settings);
      final result = ListResponse.fromJson(
          response?.data, (json) => SettingModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse<DateModel>>> getYachtDates(
      String yachtId) async {
    try {
      Map<String, String> data = {
        Url.yachtIdKey: yachtId,
      };
      final response = await DioFactory.get(Url.baseUrl + Url.getYachtDates,
          queryParameters: data);
      final result = ListResponse.fromJson(
          response?.data, (json) => DateModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse<TimeModel>>> getYachtTimes(
      String yachtId, String date) async {
    try {
      Map<String, String> data = {
        Url.yachtIdKey: yachtId,
        Url.dateKey: date,
      };
      final response = await DioFactory.get(Url.baseUrl + Url.getYachtTimes,
          queryParameters: data);
      final result = ListResponse.fromJson(
          response?.data, (json) => TimeModel.fromJson(json));
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
