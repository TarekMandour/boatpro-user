import 'dart:convert';

class FCMNotificationItem {
  final String id;
  final String title;
  final String body;
  final Map<String, dynamic>? additionalData;
  final DateTime? date;

  const FCMNotificationItem({
    required this.id,
    required this.title,
    required this.body,
    this.additionalData,
    required this.date,
  });
  factory FCMNotificationItem.fromJson(Map<String, dynamic> json) {
    return FCMNotificationItem(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        date: DateTime.tryParse(json['date']),
        additionalData: json);
  }

  FCMNotificationItem copyWith({
    String? id,
    String? title,
    String? body,
    bool? seen,
    Map? additionalData,
    DateTime? date,
  }) {
    return FCMNotificationItem(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      additionalData: Map<String, dynamic>.from(
          jsonDecode(jsonEncode(additionalData ?? this.additionalData ?? {}))),
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toJson() {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', id);
    writeNotNull('title', title);
    writeNotNull('body', body);
    writeNotNull('additionalData', additionalData);
    writeNotNull('date', date.toString());
    return val;
  }
}
