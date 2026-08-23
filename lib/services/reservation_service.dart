import 'package:dartz/dartz.dart';
import 'package:example/models/pay.dart';
import 'package:example/models/reservation.dart';
import 'package:example/models/reservation_details.dart';
import 'package:example/models/time.dart';
import 'package:example/ui/index.dart';

class ReservationService {
  Future<Either<Failure, ListResponse>> bookYacht({
    required String yachtId,
    // required DateTime? startDay,
    required List<TimeModel> times,
    required String note,
    String? numGuests,
  }) async {
    try {
      // TODO: add times array [id] in store and update
      List<String> timesList = [];
      times.forEach(
        (element) {
          timesList.add(element.id.toString());
        },
      );
      print(timesList);
      Map<String, dynamic> data = {
        Url.yachtIdKey: yachtId,
        // Url.startDayKey: startDay.toString(), // remove it
        // Url.endDayKey: endDay.toString(), // remove it
        // add times [id]
        // Url.timesKey: timesList.toList(growable: true),
        Url.noteKey: note,
        if (numGuests != null) Url.numGuestsKey: numGuests,
      };
      for (var i = 0; i < (timesList.length); i++) {
        data.addAll({"${Url.timesKey}[$i]": timesList[i]});
      }
      final formData = FormData.fromMap(data);

      print(formData);
      final response = await DioFactory.post(
          Url.baseUrl + Url.user + Url.reservations + Url.store, formData);
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

  Future<Either<Failure, ListResponse>> updateYacht({
    required String yachtId,
    required DateTime? startDay,
    required DateTime? endDay,
    required String note,
  }) async {
    try {
      Map<String, String> data = {
        Url.startDayKey: startDay.toString(),
        Url.endDayKey: endDay.toString(),
        Url.noteKey: note,
      };
      final formData = FormData.fromMap(data);
      final response = await DioFactory.post(
          Url.baseUrl + Url.user + Url.reservations + Url.update + '/$yachtId',
          formData);
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

  Future<Either<Failure, ListResponse<ReservationModel>>>
      getReservations() async {
    try {
      final response = await DioFactory.get(
          Url.baseUrl + Url.user + Url.reservations + Url.list);
      final result = ListResponse.fromJson(
          response?.data, (json) => ReservationModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, BaseDataResponse<ReservationDetailsModel>>>
      getReservationDetails(String id) async {
    try {
      final response = await DioFactory.get(
          Url.baseUrl + Url.user + Url.reservations + "/$id");
      final result = BaseDataResponse.fromJson(
          response?.data, (json) => ReservationDetailsModel.fromJson(json));
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } on DioError catch (e) {
      return Left(Failure.fromJson(e.response?.data));
    } catch (e) {
      return Left(Failure(message: e.toString(), success: false));
    }
  }

  Future<Either<Failure, ListResponse>> cancelReservation(String id) async {
    try {
      final response = await DioFactory.post(
          Url.baseUrl + Url.user + Url.reservations + Url.cancel + "/$id",
          null);
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

  Future<Either<Failure, BaseDataResponse<PayModel>>> confirmPay({
    required String yachtId,
    required String paymentMethod,
    required String subTotal,
    required String vat,
    required String serviceFee,
    required String total,
  }) async {
    try {
      Map<String, String> data = {
        Url.yachtIdKey: yachtId,
        Url.paymentMethodKey: paymentMethod,
        Url.subTotalKey: subTotal,
        Url.vatKey: vat,
        Url.serviceFeeKey: serviceFee,
        Url.totalKey: total,
      };
      final formData = FormData.fromMap(data);
      final response = await DioFactory.post(
          Url.baseUrl + Url.user + Url.reservations + Url.pay + '/$yachtId',
          formData);
      final result = BaseDataResponse.fromJson(
          response?.data, (json) => PayModel.fromJson(json));
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
