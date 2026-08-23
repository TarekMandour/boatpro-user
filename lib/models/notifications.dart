import 'dart:convert';

class NotificationModel {
  int? id;
  String? title;
  String? body;
  DateTime? date;

  NotificationModel({
    this.id,
    this.title,
    this.body,
    this.date,
  });

  factory NotificationModel.fromRawJson(String str) =>
      NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "date": date?.toIso8601String(),
      };
}
