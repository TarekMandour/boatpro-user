import 'package:dartz/dartz.dart';
import 'package:example/ui/index.dart';

class FavouriteService {
  Future<Either<Failure, ListResponse>> addFavourite({
    required String yachtId,
  }) async {
    try {
      Map<String, String> data = {
        Url.yachtIdKey: yachtId,
      };
      final formData = FormData.fromMap(data);
      final response = await DioFactory.post(
          Url.baseUrl + Url.user + Url.favourites + Url.store, formData);
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

  Future<Either<Failure, ListResponse<YachtModel>>> getFavourites() async {
    try {
      final response =
          await DioFactory.get(Url.baseUrl + Url.user + Url.favourites);
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
}
