import 'dart:convert';

import 'package:example/models/provider.dart';

class YachtModel {
  int? id;
  String? name;
  int? price;
  int? isDiscount;
  int? discountValue;
  String? address;
  String? description;
  String? addInfo;
  String? bookingInfo;
  bool? status;
  num? longitude;
  num? latitude;
  List<String>? image;
  bool? isFav;
  int? reservations;
  double? rate;
  ProviderModel? provider;
  List<Specification>? specifications;

  YachtModel({
    this.id,
    this.name,
    this.price,
    this.isDiscount,
    this.discountValue,
    this.address,
    this.description,
    this.addInfo,
    this.bookingInfo,
    this.status,
    this.longitude,
    this.latitude,
    this.image,
    this.isFav,
    this.reservations,
    this.rate,
    this.provider,
    this.specifications,
  });

  factory YachtModel.fromRawJson(String str) =>
      YachtModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory YachtModel.fromJson(Map<String, dynamic> json) => YachtModel(
        id: json["id"],
        name: json["name"],
        price: (json["price"] as num?)?.toInt(),
        isDiscount: (json["is_discount"] as num?)?.toInt(),
        discountValue: (json["discount_value"] as num?)?.toInt(),
        address: json["address"],
        description: json["description"],
        addInfo: json["add_info"],
        bookingInfo: json["booking_info"],
        status: json["status"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        image: json["image"] == null
            ? []
            : List<String>.from(json["image"]!.map((x) => x)),
        isFav: json["is_fav"],
        reservations: (json["reservations"] as num?)?.toInt(),
        rate: (json["rate"] as num?)?.toDouble(),
        provider: json["provider"] == null
            ? null
            : ProviderModel.fromJson(json["provider"]),
        specifications: json["specifications"] == null
            ? []
            : List<Specification>.from(
                json["specifications"]!.map((x) => Specification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "is_discount": isDiscount,
        "discount_value": discountValue,
        "address": address,
        "description": description,
        "add_info": addInfo,
        "booking_info": bookingInfo,
        "status": status,
        "longitude": longitude,
        "latitude": latitude,
        "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x)),
        "is_fav": isFav,
        "reservations": reservations,
        "rate": rate,
        "provider": provider?.toJson(),
        "specifications": specifications == null
            ? []
            : List<dynamic>.from(specifications!.map((x) => x.toJson())),
      };
}

class Specification {
  int? id;
  String? nameEn;
  String? nameAr;
  String? icon;

  Specification({
    this.id,
    this.nameEn,
    this.nameAr,
    this.icon,
  });

  factory Specification.fromRawJson(String str) =>
      Specification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Specification.fromJson(Map<String, dynamic> json) => Specification(
        id: json["id"],
        nameEn: json["name_en"],
        nameAr: json["name_ar"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name_ar": nameAr,
        "icon": icon,
      };
}
