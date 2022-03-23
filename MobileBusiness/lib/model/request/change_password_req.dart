// To parse this JSON data, do
//
//     final changePasswordReq = changePasswordReqFromJson(jsonString);

import 'dart:convert';

ChangePasswordReq changePasswordReqFromJson(String str) =>
    ChangePasswordReq.fromJson(json.decode(str));

String changePasswordReqToJson(ChangePasswordReq data) =>
    json.encode(data.toJson());

class ChangePasswordReq {
  ChangePasswordReq({
    required this.oldPassword,
    required this.newPassword,
  });

  String oldPassword;
  String newPassword;

  factory ChangePasswordReq.fromJson(Map<String, dynamic> json) =>
      ChangePasswordReq(
        oldPassword: json["oldPassword"],
        newPassword: json["newPassword"],
      );

  Map<String, dynamic> toJson() => {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      };
}
