// To parse this JSON data, do
//
//     final getBidaTableRes = getBidaTableResFromJson(jsonString);

import 'dart:convert';

class GetBidaTableRes {
  GetBidaTableRes({
    this.id,
    this.name,
    this.type,
    this.image,
    this.price,
    this.status,
    this.bidaClubId,
    this.bidaClub,
  });

  String? id;
  String? name;
  String? type;
  String? image;
  int? price;
  String? status;
  String? bidaClubId;
  dynamic bidaClub;

  factory GetBidaTableRes.fromJson(Map<String, dynamic> json) =>
      GetBidaTableRes(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        image: json["image"],
        price: json["price"],
        status: json["status"],
        bidaClubId: json["bidaClubId"],
        bidaClub: json["bidaClub"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "image": image,
        "price": price,
        "status": status,
        "bidaClubId": bidaClubId,
        "bidaClub": bidaClub,
      };

  static List<GetBidaTableRes> getBidaTableResFromJson(String str) =>
      List<GetBidaTableRes>.from(
          json.decode(str).map((x) => GetBidaTableRes.fromJson(x)));

  static GetBidaTableRes getBidaTableDetailResFromJson(String str) =>
      GetBidaTableRes.fromJson(json.decode(str));

  String getBidaTableResToJson(List<GetBidaTableRes> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
}
