// To parse this JSON data, do
//
//     final signUpReq = signUpReqFromJson(jsonString);

import 'dart:convert';

SignUpReq signUpReqFromJson(String str) => SignUpReq.fromJson(json.decode(str));

String signUpReqToJson(SignUpReq data) => json.encode(data.toJson());

class SignUpReq {
  SignUpReq({
    this.username,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.password,
    this.image,
    this.roleId,
  });

  String? username;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? password;
  String? image;
  String? roleId;

  factory SignUpReq.fromJson(Map<String, dynamic> json) => SignUpReq(
        username: json["username"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        image: json["image"],
        roleId: json["roleId"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "image": image,
        "roleId": roleId,
      };
}
