// To parse this JSON data, do
//
//     final signUpRes = signUpResFromJson(jsonString);

import 'dart:convert';

class SignUpRes {
  SignUpRes({
    this.id,
    this.username,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.password,
    this.image,
    this.roleId,
  });

  String? id;
  String? username;
  String? fullName;
  dynamic email;
  String? phoneNumber;
  String? password;
  String? image;
  String? roleId;

  factory SignUpRes.fromJson(Map<String, dynamic> json) => SignUpRes(
        id: json["id"],
        username: json["username"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        password: json["password"],
        image: json["image"],
        roleId: json["roleId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "image": image,
        "roleId": roleId,
      };

  static SignUpRes signUpResFromJson(String str) =>
      SignUpRes.fromJson(json.decode(str));

  String signUpResToJson(SignUpRes data) => json.encode(data.toJson());
}
