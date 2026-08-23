import 'dart:convert';

import 'package:example/models/yacht.dart';

class ReservationDetailsModel {
  int? id;
  String? date;
  List<String>? images;
  Provider? user;
  Provider? provider;

  // DateTime? startDay;
  // DateTime? endDay;
  String? reservationsStatus;
  String? paymentMethod;
  int? total;
  String? note;
  YachtModel? yacht;
  List<DateAndTime>? times;

  ReservationDetailsModel({
    this.id,
    this.date,
    this.images,
    this.user,
    this.provider,
    // this.startDay,
    // this.endDay,
    this.reservationsStatus,
    this.paymentMethod,
    this.total,
    this.note,
    this.yacht,
    this.times,
  });

  factory ReservationDetailsModel.fromRawJson(String str) =>
      ReservationDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservationDetailsModel.fromJson(Map<String, dynamic> json) =>
      ReservationDetailsModel(
        id: json["id"],
        date: json["date"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        user: json["user"] == null ? null : Provider.fromJson(json["user"]),
        provider: json["provider"] == null
            ? null
            : Provider.fromJson(json["provider"]),

        // startDay: json["start_day"] == null ? null : DateTime.parse(json["start_day"]),
        // endDay: json["end_day"] == null ? null : DateTime.parse(json["end_day"]),

        reservationsStatus: json["reservations_status"],
        paymentMethod: json["payment_method"],
        total: json["total"],
        note: json["note"],
        yacht:
            json["yacht"] == null ? null : YachtModel.fromJson(json["yacht"]),
        times: json["times"] == null
            ? []
            : List<DateAndTime>.from(
                json["times"]!.map((x) => DateAndTime.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "user": user?.toJson(),
        "provider": provider?.toJson(),
        // "start_day": startDay?.toIso8601String(),
        // "end_day": endDay?.toIso8601String(),
        "reservations_status": reservationsStatus,
        "payment_method": paymentMethod,
        "total": total,
        "note": note,
        "yacht": yacht,
        "times": times == null
            ? []
            : List<dynamic>.from(times!.map((x) => x.toJson())),
      };
}

class DateAndTime {
  int? id;
  int? yachtId;
  DateTime? date;
  String? startTime;
  String? endTime;
  int? price;
  Pivot? pivot;

  DateAndTime({
    this.id,
    this.yachtId,
    this.date,
    this.startTime,
    this.endTime,
    this.price,
    this.pivot,
  });

  factory DateAndTime.fromRawJson(String str) =>
      DateAndTime.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DateAndTime.fromJson(Map<String, dynamic> json) => DateAndTime(
        id: json["id"],
        yachtId: json["yacht_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startTime: json["start_time"],
        endTime: json["end_time"],
        price: json["price"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "yacht_id": yachtId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "price": price,
        "pivot": pivot?.toJson(),
      };
}

class Pivot {
  int? reservationsId;
  int? timesId;

  Pivot({
    this.reservationsId,
    this.timesId,
  });

  factory Pivot.fromRawJson(String str) => Pivot.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        reservationsId: json["reservations_id"],
        timesId: json["times_id"],
      );

  Map<String, dynamic> toJson() => {
        "reservations_id": reservationsId,
        "times_id": timesId,
      };
}

class Provider {
  int? id;
  String? name;
  String? phone;
  String? image;

  Provider({
    this.id,
    this.name,
    this.phone,
    this.image,
  });

  factory Provider.fromRawJson(String str) =>
      Provider.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "image": image,
      };
}
