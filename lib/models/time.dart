import 'dart:convert';

class TimeModel {
  int? id;
  String? startTime;
  String? endTime;

  TimeModel({
    this.id,
    this.startTime,
    this.endTime,
  });

  factory TimeModel.fromRawJson(String str) =>
      TimeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
        id: json["id"],
        startTime: json["start_time"],
        endTime: json["end_time"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start_time": startTime,
        "end_time": endTime,
      };
}
