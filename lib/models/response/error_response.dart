import 'dart:convert';

class ErrorResponse {
  ErrorResponse({
    // required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  // bool success;
  int statusCode;
  String message;
  String data;

  factory ErrorResponse.fromRawJson(String str) =>
      ErrorResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        // success: json["success"],
        statusCode: json["statusCode"] ?? 0,
        message: json["message"].toString(),
        data: json["responseStatus"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "error": message,
      };
}
