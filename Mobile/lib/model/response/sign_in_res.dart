// To parse this JSON data, do
//
//     final signInRes = signInResFromJson(jsonString);

import 'dart:convert';

class SignInRes {
  SignInRes({
    this.token,
  });

  String? token;

  factory SignInRes.fromJson(Map<String, dynamic> json) => SignInRes(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };

  static SignInRes signInResFromJson(String str) =>
      SignInRes.fromJson(json.decode(str));

  String signInResToJson(SignInRes data) => json.encode(data.toJson());
}
