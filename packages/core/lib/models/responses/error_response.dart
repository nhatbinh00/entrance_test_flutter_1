// To parse this JSON data, do
//
//     final errorResponse = errorResponseFromJson(jsonString);

import 'dart:convert';

ErrorResponse? errorResponseFromJson(String str) => ErrorResponse.fromJson(json.decode(str));

String errorResponseToJson(ErrorResponse? data) => json.encode(data!.toJson());

class ErrorResponse {
  ErrorResponse({
    this.errors,
    this.statusCode,
    this.success,
  });

  Errors? errors;
  int? statusCode;
  bool? success;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    errors: Errors.fromJson(json["errors"]),
    statusCode: json["statusCode"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "errors": errors!.toJson(),
    "statusCode": statusCode,
    "success": success,
  };
}

class Errors {
  Errors({
    this.message,
    this.error,
    this.stack,
  });

  List<String?>? message;
  String? error;
  String? stack;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
    message: json["message"] == null ? [] : List<String?>.from(json["message"]!.map((x) => x)),
    error: json["error"],
    stack: json["stack"],
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
    "error": error,
    "stack": stack,
  };
}