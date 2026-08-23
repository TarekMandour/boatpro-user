import 'dart:convert';

import 'package:example/models/user_model.dart';

class RateModel {
  int? id;
  int? stars;
  String? comment;
  UserModel? user;
  DateTime? date;

  RateModel({
    this.id,
    this.stars,
    this.comment,
    this.user,
    this.date,
  });

  factory RateModel.fromRawJson(String str) =>
      RateModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
        id: json["id"],
        stars: json["stars"],
        comment: json["comment"],
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "stars": stars,
        "comment": comment,
        "user": user?.toJson(),
        "date": date?.toIso8601String(),
      };
}
