import 'dart:convert';

class DateModel {
  int? id;
  DateTime? date;

  DateModel({
    this.id,
    this.date,
  });

  factory DateModel.fromRawJson(String str) =>
      DateModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DateModel.fromJson(Map<String, dynamic> json) => DateModel(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
      };
}
