import 'dart:convert';

class CountryModel {
  int? id;
  String? name;
  String? isoCode;

  CountryModel({
    this.id,
    this.name,
    this.isoCode,
  });

  factory CountryModel.fromRawJson(String str) =>
      CountryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json["id"],
        name: json["name"],
        isoCode: json["iso_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iso_code": isoCode,
      };
}
