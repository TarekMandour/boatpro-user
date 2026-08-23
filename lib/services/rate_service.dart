import 'package:dartz/dartz.dart';
import 'package:example/models/rate.dart';
import 'package:example/ui/index.dart';

class RateService {
  Future<Either<Failure, ListResponse<RateModel>>> getRate({
    final String? type,
    final String? typeId,
  }) async {
    try {
      Map<String, String> data = {
        if (type != null) Url.typeKey: type.toString(),
        if (typeId != null) Url.typeIdKey: typeId.toString(),
      };
      final response = await DioFactory.get(Url.baseUrl + Url.rate + Url.list,
          queryParameters: data);
      final result = ListResponse<RateModel>.fromJson(
          response?.data, (json) => RateModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse>> storeRate({
    required int stars,
    required String comment,
    required String type,
    required String typeId,
  }) async {
    try {
      final Map<String, dynamic> data = {
        'rate[0][${Url.typeKey}]': type,
        'rate[0][${Url.typeIdKey}]': typeId,
        'rate[0][${Url.starsKey}]': stars.toString(),
        'rate[0][${Url.commentKey}]': comment,
      };
      final formData = FormData.fromMap(data);
      final response = await DioFactory.post(
          Url.baseUrl + Url.user + Url.rate + Url.store, formData);
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
}
