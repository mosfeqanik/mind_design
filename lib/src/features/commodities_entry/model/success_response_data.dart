import 'dart:convert';

class SuccessResponseData {
  final String? message;

  SuccessResponseData({
    this.message,
  });

  factory SuccessResponseData.fromRawJson(String str) =>
      SuccessResponseData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SuccessResponseData.fromJson(Map<String, dynamic> json) =>
      SuccessResponseData(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
