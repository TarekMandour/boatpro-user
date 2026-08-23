class BasicResponse {
  final String message;
  final int status;

  BasicResponse({required this.message, required this.status});

  factory BasicResponse.fromJson(Map<String, dynamic> json) {
    return BasicResponse(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
    );
  }
}

class BaseDataResponse<T> extends BasicResponse {
  final T data;

  BaseDataResponse(
      {required String message, required int status, required this.data})
      : super(message: message, status: status);

  factory BaseDataResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return BaseDataResponse<T>(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
      data: fromJsonT(json['data']),
    );
  }
}

class ListResponse<T> extends BasicResponse {
  final List<T> data;

  ListResponse(
      {required String message, required int status, required this.data})
      : super(message: message, status: status);

  factory ListResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ListResponse<T>(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
      data: (json['data'] as List<dynamic>).map((e) => fromJsonT(e)).toList(),
    );
  }
}
