import 'dart:convert';

class PageModel {
  int? id;
  String? name;
  String? content;

  PageModel({
    this.id,
    this.name,
    this.content,
  });

  factory PageModel.fromRawJson(String str) =>
      PageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PageModel.fromJson(Map<String, dynamic> json) => PageModel(
        id: json["id"],
        name: json["name"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "content": content,
      };
}
