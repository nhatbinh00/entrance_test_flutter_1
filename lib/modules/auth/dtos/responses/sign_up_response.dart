// To parse this JSON data, do
//
//     final signUpResponse = signUpResponseFromJson(jsonString);

import 'dart:convert';

SignUpResponse? signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));

String signUpResponseToJson(SignUpResponse? data) => json.encode(data!.toJson());

class SignUpResponse {
  SignUpResponse({
    this.id,
    this.email,
    this.admin,
    this.firstName,
    this.lastName,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.displayName,
    this.token,
    this.refreshToken,
  });

  String? id;
  String? email;
  bool? admin;
  String? firstName;
  String? lastName;
  String? createdAt;
  String? updatedAt;
  int? v;
  String? displayName;
  String? token;
  String? refreshToken;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    id: json["_id"],
    email: json["email"],
    admin: json["admin"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    displayName: json["displayName"],
    token: json["token"],
    refreshToken: json["refreshToken"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "admin": admin,
    "firstName": firstName,
    "lastName": lastName,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "displayName": displayName,
    "token": token,
    "refreshToken": refreshToken,
  };
}
