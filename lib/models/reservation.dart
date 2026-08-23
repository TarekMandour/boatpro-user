import 'dart:convert';

class ReservationModel {
  int? id;
  String? date;
  String? yachtName;
  String? yachtImage;
  User? user;
  int? total;
  String? paymentMethod;
  String? reservationsStatus;

  ReservationModel({
    this.id,
    this.date,
    this.yachtName,
    this.yachtImage,
    this.user,
    this.total,
    this.paymentMethod,
    this.reservationsStatus,
  });

  factory ReservationModel.fromRawJson(String str) =>
      ReservationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReservationModel.fromJson(Map<String, dynamic> json) =>
      ReservationModel(
        id: json["id"],
        date: json["date"],
        yachtName: json["yacht_name"],
        yachtImage: json["yacht_image"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        total: json["total"],
        paymentMethod: json["payment_method"],
        reservationsStatus: json["reservations_status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "yacht_name": yachtName,
        "yacht_image": yachtImage,
        "user": user?.toJson(),
        "total": total,
        "payment_method": paymentMethod,
        "reservations_status": reservationsStatus,
      };
}

class User {
  int? id;
  String? name;
  String? phone;

  User({
    this.id,
    this.name,
    this.phone,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
