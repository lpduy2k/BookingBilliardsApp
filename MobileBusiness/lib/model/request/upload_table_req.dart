// To parse this JSON data, do
//
//     final uploadTableReq = uploadTableReqFromJson(jsonString);

import 'dart:convert';

UploadTableReq uploadTableReqFromJson(String str) =>
    UploadTableReq.fromJson(json.decode(str));

String uploadTableReqToJson(UploadTableReq data) => json.encode(data.toJson());

class UploadTableReq {
  UploadTableReq({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
    required this.price,
    required this.status,
    required this.bidaClubId,
  });

  String id;
  String name;
  String type;
  String image;
  int price;
  String status;
  String bidaClubId;

  factory UploadTableReq.fromJson(Map<String, dynamic> json) => UploadTableReq(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        image: json["image"],
        price: json["price"],
        status: json["status"],
        bidaClubId: json["bidaClubId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "image": image,
        "price": price,
        "status": status,
        "bidaClubId": bidaClubId,
      };
}
