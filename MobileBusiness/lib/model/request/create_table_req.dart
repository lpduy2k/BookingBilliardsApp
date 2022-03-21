// To parse this JSON data, do
//
//     final createTableReq = createTableReqFromJson(jsonString);

import 'dart:convert';

CreateTableReq createTableReqFromJson(String str) =>
    CreateTableReq.fromJson(json.decode(str));

String createTableReqToJson(CreateTableReq data) => json.encode(data.toJson());

class CreateTableReq {
  CreateTableReq({
    this.name,
    this.type,
    this.image,
    this.price,
    this.status,
    this.bidaClubId,
  });

  String? name;
  String? type;
  String? image;
  double? price;
  String? status;
  String? bidaClubId;

  factory CreateTableReq.fromJson(Map<String, dynamic> json) => CreateTableReq(
        name: json["name"],
        type: json["type"],
        image: json["image"],
        price: json["price"],
        status: json["status"],
        bidaClubId: json["bidaClubId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "image": image,
        "price": price,
        "status": status,
        "bidaClubId": bidaClubId,
      };
}
