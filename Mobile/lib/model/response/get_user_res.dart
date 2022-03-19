// To parse this JSON data, do
//
//     final getUserRes = getUserResFromJson(jsonString);

import 'dart:convert';

class GetUserRes {
  GetUserRes({
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
  String? email;
  String? phoneNumber;
  String? password;
  String? image;
  String? roleId;

  factory GetUserRes.fromJson(Map<String, dynamic> json) => GetUserRes(
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

  static GetUserRes getUserResFromJson(String str) =>
      GetUserRes.fromJson(json.decode(str));

  String getUserResToJson(GetUserRes data) => json.encode(data.toJson());
}
