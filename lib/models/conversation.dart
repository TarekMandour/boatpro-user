import 'dart:convert';

class ConversationModel {
  int? id;
  String? message;
  int? senderId;
  int? receiverId;
  DateTime? createdAt;

  ConversationModel({
    this.id,
    this.message,
    this.senderId,
    this.receiverId,
    this.createdAt,
  });

  factory ConversationModel.fromRawJson(String str) =>
      ConversationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ConversationModel.fromJson(Map<String, dynamic> json) =>
      ConversationModel(
        id: json["id"],
        message: json["message"],
        senderId: json["sender_id"],
        receiverId: json["receiver_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "sender_id": senderId,
        "receiver_id": receiverId,
        "created_at": createdAt?.toIso8601String(),
      };
}
