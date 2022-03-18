// To parse this JSON data, do
//
//     final signInReq = signInReqFromJson(jsonString);

import 'dart:convert';

SignInReq signInReqFromJson(String str) => SignInReq.fromJson(json.decode(str));

String signInReqToJson(SignInReq data) => json.encode(data.toJson());

class SignInReq {
  SignInReq({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory SignInReq.fromJson(Map<String, dynamic> json) => SignInReq(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}
