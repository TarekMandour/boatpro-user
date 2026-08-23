import 'dart:convert';

class Failure {
  final bool success;
  final String message;
  final DataError? data;

  const Failure({required this.success, required this.message, this.data});

  factory Failure.fromJson(Map<String, dynamic> json) {
    print((json["data"] is List<dynamic>));
    return Failure(
      success: json['success'] ?? false,
      message: json['message'],
      data: (json["data"] == null || json["data"] is List<dynamic>)
          ? null
          : DataError.fromJson(json["data"]),
    );
  }
  @override
  String toString() =>
      'Failure { success: $success, message: $message, data: $data }';
}

class DataError {
  List<String>? phone;

  DataError({
    this.phone,
  });

  factory DataError.fromRawJson(String str) =>
      DataError.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataError.fromJson(Map<String, dynamic> json) => DataError(
        phone: json["phone"] == null
            ? []
            : List<String>.from(json["phone"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "phone": phone == null ? [] : List<dynamic>.from(phone!.map((x) => x)),
      };
}
