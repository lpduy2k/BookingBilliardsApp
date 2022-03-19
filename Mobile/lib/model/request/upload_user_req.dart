// To parse this JSON data, do
//
//     final uploadUserReq = uploadUserReqFromJson(jsonString);

import 'dart:convert';

UploadUserReq uploadUserReqFromJson(String str) =>
    UploadUserReq.fromJson(json.decode(str));

String uploadUserReqToJson(UploadUserReq data) => json.encode(data.toJson());

class UploadUserReq {
  UploadUserReq({
    required this.id,
    required this.username,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.image,
    required this.roleId,
  });

  String id;
  String username;
  String fullName;
  String email;
  String phoneNumber;
  String password;
  String image;
  String roleId;

  factory UploadUserReq.fromJson(Map<String, dynamic> json) => UploadUserReq(
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
}
