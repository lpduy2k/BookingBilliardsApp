// To parse this JSON data, do
//
//     final uploadImageRes = uploadImageResFromJson(jsonString);

import 'dart:convert';

class UploadImageRes {
  UploadImageRes({
    this.urlImage,
  });

  String? urlImage;

  factory UploadImageRes.fromJson(Map<String, dynamic> json) => UploadImageRes(
        urlImage: json["urlImage"],
      );

  Map<String, dynamic> toJson() => {
        "urlImage": urlImage,
      };

  static UploadImageRes uploadImageResFromJson(String str) =>
      UploadImageRes.fromJson(json.decode(str));

  String uploadImageResToJson(UploadImageRes data) =>
      json.encode(data.toJson());
}
