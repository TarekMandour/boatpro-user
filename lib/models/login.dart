import 'dart:convert';

class LoginModel {
  int? id;
  String? name;
  String? status;
  String? role;
  String? token;

  LoginModel({
    this.id,
    this.name,
    this.status,
    this.role,
    this.token,
  });

  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        role: json["role"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "role": role,
        "token": token,
      };
}
