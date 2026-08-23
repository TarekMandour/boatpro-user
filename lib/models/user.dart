import 'dart:convert';

class UserData {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? isActive;
  String? fcmToken;
  String? language;
  String? image;
  String? token;

  UserData({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.isActive,
    this.fcmToken,
    this.language,
    this.image,
    this.token,
  });

  factory UserData.fromRawJson(String str) =>
      UserData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        isActive: json["is_active"],
        fcmToken: json["fcm_token"] ?? '',
        language: json["language"],
        image: json["image"],
        token: json["token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "email": email,
        "is_active": isActive,
        "fcm_token": fcmToken,
        "language": language,
        "image": image,
        "token": token,
      };
}
