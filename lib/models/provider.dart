import 'dart:convert';

class ProviderModel {
  int? id;
  String? name;
  String? image;

  ProviderModel({
    this.id,
    this.name,
    this.image,
  });

  factory ProviderModel.fromRawJson(String str) =>
      ProviderModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProviderModel.fromJson(Map<String, dynamic> json) => ProviderModel(
        id: json["id"],
        name: json["name"],
        image: json["image"] == '' ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}
