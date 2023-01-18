// To parse this JSON data, do
//
//     final signUpRequest = signUpRequestFromJson(jsonString);

import 'dart:convert';

SignUpRequest? signUpRequestFromJson(String str) => SignUpRequest.fromJson(json.decode(str));

String signUpRequestToJson(SignUpRequest? data) => json.encode(data!.toJson());

class SignUpRequest {
  SignUpRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? password;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => SignUpRequest(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "password": password,
  };
}
