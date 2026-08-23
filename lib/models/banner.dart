import 'dart:convert';

class BannerModel {
  int? id;
  String? image;

  BannerModel({
    this.id,
    this.image,
  });

  factory BannerModel.fromRawJson(String str) =>
      BannerModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
