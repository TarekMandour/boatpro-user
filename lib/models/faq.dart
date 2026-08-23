import 'dart:convert';

class FaqModel {
  int? id;
  String? title;
  String? body;

  FaqModel({
    this.id,
    this.title,
    this.body,
  });

  factory FaqModel.fromRawJson(String str) =>
      FaqModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
      };
}
