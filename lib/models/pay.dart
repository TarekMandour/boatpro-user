import 'dart:convert';

class PayModel {
  int? reservationId;
  String? paymentLink;

  PayModel({
    this.reservationId,
    this.paymentLink,
  });

  factory PayModel.fromRawJson(String str) =>
      PayModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PayModel.fromJson(Map<String, dynamic> json) => PayModel(
        reservationId: json["reservation_id"],
        paymentLink: json["payment_link"],
      );

  Map<String, dynamic> toJson() => {
        "reservation_id": reservationId,
        "payment_link": paymentLink,
      };
}
